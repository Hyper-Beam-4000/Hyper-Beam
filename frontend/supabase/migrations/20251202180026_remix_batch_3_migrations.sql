
-- Migration: 20251017201234
-- Create profiles table for user information
CREATE TABLE public.profiles (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  email TEXT NOT NULL,
  team_name TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Enable RLS
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

-- Policies for profiles
CREATE POLICY "Users can view their own profile"
  ON public.profiles
  FOR SELECT
  USING (auth.uid() = id);

CREATE POLICY "Users can update their own profile"
  ON public.profiles
  FOR UPDATE
  USING (auth.uid() = id);

CREATE POLICY "Users can insert their own profile"
  ON public.profiles
  FOR INSERT
  WITH CHECK (auth.uid() = id);

-- Create submissions table
CREATE TABLE public.submissions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  model_name TEXT NOT NULL,
  api_endpoint TEXT NOT NULL,
  description TEXT,
  is_active BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  
  -- Performance scores (initially null until contest ends)
  overall_score DECIMAL(5,2),
  knowledge_score INTEGER,
  math_score INTEGER,
  factuality_score INTEGER,
  safety_score INTEGER,
  multilingual_score INTEGER,
  long_context_score INTEGER,
  multimodal_score INTEGER
);

-- Enable RLS
ALTER TABLE public.submissions ENABLE ROW LEVEL SECURITY;

-- Policies for submissions
CREATE POLICY "Users can view their own submissions"
  ON public.submissions
  FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Anyone can view submission existence (for leaderboard)"
  ON public.submissions
  FOR SELECT
  USING (true);

CREATE POLICY "Users can create their own submissions"
  ON public.submissions
  FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update their own submissions"
  ON public.submissions
  FOR UPDATE
  USING (auth.uid() = user_id);

CREATE POLICY "Users can delete their own submissions"
  ON public.submissions
  FOR DELETE
  USING (auth.uid() = user_id);

-- Trigger to auto-create profile on signup
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  INSERT INTO public.profiles (id, email)
  VALUES (new.id, new.email);
  RETURN new;
END;
$$;

CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- Function to update updated_at timestamp
CREATE OR REPLACE FUNCTION public.update_updated_at()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$;

CREATE TRIGGER update_profiles_updated_at
  BEFORE UPDATE ON public.profiles
  FOR EACH ROW
  EXECUTE FUNCTION public.update_updated_at();

-- Migration: 20251017201245
-- Fix search_path for update_updated_at function
DROP FUNCTION IF EXISTS public.update_updated_at() CASCADE;

CREATE OR REPLACE FUNCTION public.update_updated_at()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$;

-- Recreate the trigger
CREATE TRIGGER update_profiles_updated_at
  BEFORE UPDATE ON public.profiles
  FOR EACH ROW
  EXECUTE FUNCTION public.update_updated_at();

-- Migration: 20251202173723
-- Drop old score columns and add new math-focused ones
ALTER TABLE public.submissions
DROP COLUMN IF EXISTS knowledge_score,
DROP COLUMN IF EXISTS math_score,
DROP COLUMN IF EXISTS factuality_score,
DROP COLUMN IF EXISTS safety_score,
DROP COLUMN IF EXISTS multilingual_score,
DROP COLUMN IF EXISTS long_context_score,
DROP COLUMN IF EXISTS multimodal_score;

-- Add new math-focused evaluation metrics
ALTER TABLE public.submissions
ADD COLUMN IF NOT EXISTS problem_solving_score numeric NULL,
ADD COLUMN IF NOT EXISTS self_repair_score numeric NULL,
ADD COLUMN IF NOT EXISTS answer_prediction_score numeric NULL,
ADD COLUMN IF NOT EXISTS step_reasoning_score numeric NULL;
