-- Migration: 20260225_hyper_beam
-- Hyper Beam: problems, contests, contest_problems, evaluation_results tables
-- and submissions table modifications for the evaluation pipeline.

-- ============================================================================
-- 1. problems table
-- ============================================================================
CREATE TABLE public.problems (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  external_id TEXT UNIQUE NOT NULL,
  source TEXT NOT NULL DEFAULT 'AoPS Wiki',
  source_url TEXT,
  title TEXT,
  competition TEXT,
  problem_number INTEGER,
  problem_latex TEXT,
  solution_latex TEXT,
  answer TEXT,
  lean_code TEXT,
  difficulty TEXT,
  published_date DATE,
  scraped_at TIMESTAMPTZ DEFAULT now(),
  created_at TIMESTAMPTZ DEFAULT now()
);

ALTER TABLE public.problems ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public read access for problems"
  ON public.problems FOR SELECT
  USING (true);

CREATE POLICY "Service role can insert problems"
  ON public.problems FOR INSERT
  WITH CHECK (true);

CREATE POLICY "Service role can update problems"
  ON public.problems FOR UPDATE
  USING (true);

-- ============================================================================
-- 2. contests table
-- ============================================================================
CREATE TABLE public.contests (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  description TEXT,
  start_date TIMESTAMPTZ,
  end_date TIMESTAMPTZ,
  is_active BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT now()
);

ALTER TABLE public.contests ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public read access for contests"
  ON public.contests FOR SELECT
  USING (true);

CREATE POLICY "Service role can manage contests"
  ON public.contests FOR ALL
  USING (true);

-- ============================================================================
-- 3. contest_problems junction table
-- ============================================================================
CREATE TABLE public.contest_problems (
  contest_id UUID NOT NULL REFERENCES public.contests(id) ON DELETE CASCADE,
  problem_id UUID NOT NULL REFERENCES public.problems(id) ON DELETE CASCADE,
  PRIMARY KEY (contest_id, problem_id)
);

ALTER TABLE public.contest_problems ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public read access for contest_problems"
  ON public.contest_problems FOR SELECT
  USING (true);

CREATE POLICY "Service role can manage contest_problems"
  ON public.contest_problems FOR ALL
  USING (true);

-- ============================================================================
-- 4. Modify submissions table
-- ============================================================================
-- Drop old score columns
ALTER TABLE public.submissions
  DROP COLUMN IF EXISTS problem_solving_score,
  DROP COLUMN IF EXISTS self_repair_score,
  DROP COLUMN IF EXISTS step_reasoning_score,
  DROP COLUMN IF EXISTS answer_prediction_score;

-- Add new columns
ALTER TABLE public.submissions
  ADD COLUMN IF NOT EXISTS contest_id UUID REFERENCES public.contests(id),
  ADD COLUMN IF NOT EXISTS evaluation_status TEXT DEFAULT 'pending',
  ADD COLUMN IF NOT EXISTS training_cutoff_date DATE,
  ADD COLUMN IF NOT EXISTS answer_correctness NUMERIC(5,4),
  ADD COLUMN IF NOT EXISTS rubric_score NUMERIC(5,4),
  ADD COLUMN IF NOT EXISTS reasoning_alignment NUMERIC(5,4),
  ADD COLUMN IF NOT EXISTS embedding_similarity NUMERIC(5,4),
  ADD COLUMN IF NOT EXISTS proof_technique_match NUMERIC(5,4),
  ADD COLUMN IF NOT EXISTS concept_coverage NUMERIC(5,4);

-- ============================================================================
-- 5. evaluation_results table
-- ============================================================================
CREATE TABLE public.evaluation_results (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  submission_id UUID NOT NULL REFERENCES public.submissions(id) ON DELETE CASCADE,
  problem_id UUID NOT NULL REFERENCES public.problems(id) ON DELETE CASCADE,
  model_response TEXT,
  overall_score NUMERIC(5,4),
  answer_correctness NUMERIC(5,4),
  rubric_score NUMERIC(5,4),
  reasoning_alignment NUMERIC(5,4),
  embedding_similarity NUMERIC(5,4),
  proof_technique_match NUMERIC(5,4),
  concept_coverage NUMERIC(5,4),
  lean_compiles BOOLEAN,
  lean_sorry_free BOOLEAN,
  llm_judge_score NUMERIC(5,4),
  errors JSONB,
  evaluated_at TIMESTAMPTZ DEFAULT now(),
  UNIQUE(submission_id, problem_id)
);

ALTER TABLE public.evaluation_results ENABLE ROW LEVEL SECURITY;

-- Users can see their own results
CREATE POLICY "Users can view own evaluation results"
  ON public.evaluation_results FOR SELECT
  USING (
    submission_id IN (
      SELECT id FROM public.submissions WHERE user_id = auth.uid()
    )
  );

-- Public can see results after contest ends
CREATE POLICY "Public can view results after contest ends"
  ON public.evaluation_results FOR SELECT
  USING (
    submission_id IN (
      SELECT s.id FROM public.submissions s
      JOIN public.contests c ON s.contest_id = c.id
      WHERE c.end_date < now()
    )
  );

CREATE POLICY "Service role can manage evaluation_results"
  ON public.evaluation_results FOR ALL
  USING (true);

-- ============================================================================
-- 6. Indexes
-- ============================================================================
CREATE INDEX IF NOT EXISTS idx_problems_competition ON public.problems(competition);
CREATE INDEX IF NOT EXISTS idx_problems_difficulty ON public.problems(difficulty);
CREATE INDEX IF NOT EXISTS idx_problems_published_date ON public.problems(published_date);
CREATE INDEX IF NOT EXISTS idx_evaluation_results_submission ON public.evaluation_results(submission_id);
CREATE INDEX IF NOT EXISTS idx_evaluation_results_problem ON public.evaluation_results(problem_id);
CREATE INDEX IF NOT EXISTS idx_submissions_contest ON public.submissions(contest_id);
CREATE INDEX IF NOT EXISTS idx_submissions_evaluation_status ON public.submissions(evaluation_status);
CREATE INDEX IF NOT EXISTS idx_contests_is_active ON public.contests(is_active);
