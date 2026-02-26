export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export type Database = {
  // Allows to automatically instantiate createClient with right options
  // instead of createClient<Database, { PostgrestVersion: 'XX' }>(URL, KEY)
  __InternalSupabase: {
    PostgrestVersion: "13.0.5"
  }
  public: {
    Tables: {
      contests: {
        Row: {
          id: string
          name: string
          description: string | null
          start_date: string | null
          end_date: string | null
          is_active: boolean | null
          created_at: string
        }
        Insert: {
          id?: string
          name: string
          description?: string | null
          start_date?: string | null
          end_date?: string | null
          is_active?: boolean | null
          created_at?: string
        }
        Update: {
          id?: string
          name?: string
          description?: string | null
          start_date?: string | null
          end_date?: string | null
          is_active?: boolean | null
          created_at?: string
        }
        Relationships: []
      }
      contest_problems: {
        Row: {
          contest_id: string
          problem_id: string
        }
        Insert: {
          contest_id: string
          problem_id: string
        }
        Update: {
          contest_id?: string
          problem_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "contest_problems_contest_id_fkey"
            columns: ["contest_id"]
            isOneToOne: false
            referencedRelation: "contests"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "contest_problems_problem_id_fkey"
            columns: ["problem_id"]
            isOneToOne: false
            referencedRelation: "problems"
            referencedColumns: ["id"]
          },
        ]
      }
      evaluation_results: {
        Row: {
          id: string
          submission_id: string
          problem_id: string
          model_response: string | null
          overall_score: number | null
          answer_correctness: number | null
          rubric_score: number | null
          reasoning_alignment: number | null
          embedding_similarity: number | null
          proof_technique_match: number | null
          concept_coverage: number | null
          lean_compiles: boolean | null
          lean_sorry_free: boolean | null
          llm_judge_score: number | null
          errors: Json | null
          evaluated_at: string
        }
        Insert: {
          id?: string
          submission_id: string
          problem_id: string
          model_response?: string | null
          overall_score?: number | null
          answer_correctness?: number | null
          rubric_score?: number | null
          reasoning_alignment?: number | null
          embedding_similarity?: number | null
          proof_technique_match?: number | null
          concept_coverage?: number | null
          lean_compiles?: boolean | null
          lean_sorry_free?: boolean | null
          llm_judge_score?: number | null
          errors?: Json | null
          evaluated_at?: string
        }
        Update: {
          id?: string
          submission_id?: string
          problem_id?: string
          model_response?: string | null
          overall_score?: number | null
          answer_correctness?: number | null
          rubric_score?: number | null
          reasoning_alignment?: number | null
          embedding_similarity?: number | null
          proof_technique_match?: number | null
          concept_coverage?: number | null
          lean_compiles?: boolean | null
          lean_sorry_free?: boolean | null
          llm_judge_score?: number | null
          errors?: Json | null
          evaluated_at?: string
        }
        Relationships: [
          {
            foreignKeyName: "evaluation_results_submission_id_fkey"
            columns: ["submission_id"]
            isOneToOne: false
            referencedRelation: "submissions"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "evaluation_results_problem_id_fkey"
            columns: ["problem_id"]
            isOneToOne: false
            referencedRelation: "problems"
            referencedColumns: ["id"]
          },
        ]
      }
      problems: {
        Row: {
          id: string
          external_id: string
          source: string
          source_url: string | null
          title: string | null
          competition: string | null
          problem_number: number | null
          problem_latex: string | null
          solution_latex: string | null
          answer: string | null
          lean_code: string | null
          difficulty: string | null
          published_date: string | null
          scraped_at: string
          created_at: string
        }
        Insert: {
          id?: string
          external_id: string
          source?: string
          source_url?: string | null
          title?: string | null
          competition?: string | null
          problem_number?: number | null
          problem_latex?: string | null
          solution_latex?: string | null
          answer?: string | null
          lean_code?: string | null
          difficulty?: string | null
          published_date?: string | null
          scraped_at?: string
          created_at?: string
        }
        Update: {
          id?: string
          external_id?: string
          source?: string
          source_url?: string | null
          title?: string | null
          competition?: string | null
          problem_number?: number | null
          problem_latex?: string | null
          solution_latex?: string | null
          answer?: string | null
          lean_code?: string | null
          difficulty?: string | null
          published_date?: string | null
          scraped_at?: string
          created_at?: string
        }
        Relationships: []
      }
      profiles: {
        Row: {
          created_at: string
          email: string
          id: string
          team_name: string | null
          updated_at: string
        }
        Insert: {
          created_at?: string
          email: string
          id: string
          team_name?: string | null
          updated_at?: string
        }
        Update: {
          created_at?: string
          email?: string
          id?: string
          team_name?: string | null
          updated_at?: string
        }
        Relationships: []
      }
      submissions: {
        Row: {
          id: string
          user_id: string
          model_name: string
          api_endpoint: string
          description: string | null
          is_active: boolean | null
          created_at: string
          overall_score: number | null
          contest_id: string | null
          evaluation_status: string | null
          training_cutoff_date: string | null
          answer_correctness: number | null
          rubric_score: number | null
          reasoning_alignment: number | null
          embedding_similarity: number | null
          proof_technique_match: number | null
          concept_coverage: number | null
        }
        Insert: {
          id?: string
          user_id: string
          model_name: string
          api_endpoint: string
          description?: string | null
          is_active?: boolean | null
          created_at?: string
          overall_score?: number | null
          contest_id?: string | null
          evaluation_status?: string | null
          training_cutoff_date?: string | null
          answer_correctness?: number | null
          rubric_score?: number | null
          reasoning_alignment?: number | null
          embedding_similarity?: number | null
          proof_technique_match?: number | null
          concept_coverage?: number | null
        }
        Update: {
          id?: string
          user_id?: string
          model_name?: string
          api_endpoint?: string
          description?: string | null
          is_active?: boolean | null
          created_at?: string
          overall_score?: number | null
          contest_id?: string | null
          evaluation_status?: string | null
          training_cutoff_date?: string | null
          answer_correctness?: number | null
          rubric_score?: number | null
          reasoning_alignment?: number | null
          embedding_similarity?: number | null
          proof_technique_match?: number | null
          concept_coverage?: number | null
        }
        Relationships: [
          {
            foreignKeyName: "submissions_contest_id_fkey"
            columns: ["contest_id"]
            isOneToOne: false
            referencedRelation: "contests"
            referencedColumns: ["id"]
          },
        ]
      }
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      [_ in never]: never
    }
    Enums: {
      [_ in never]: never
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
}

type DatabaseWithoutInternals = Omit<Database, "__InternalSupabase">

type DefaultSchema = DatabaseWithoutInternals[Extract<keyof Database, "public">]

export type Tables<
  DefaultSchemaTableNameOrOptions extends
    | keyof (DefaultSchema["Tables"] & DefaultSchema["Views"])
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof (DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
        DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Views"])
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? (DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
      DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Views"])[TableName] extends {
      Row: infer R
    }
    ? R
    : never
  : DefaultSchemaTableNameOrOptions extends keyof (DefaultSchema["Tables"] &
        DefaultSchema["Views"])
    ? (DefaultSchema["Tables"] &
        DefaultSchema["Views"])[DefaultSchemaTableNameOrOptions] extends {
        Row: infer R
      }
      ? R
      : never
    : never

export type TablesInsert<
  DefaultSchemaTableNameOrOptions extends
    | keyof DefaultSchema["Tables"]
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Insert: infer I
    }
    ? I
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Insert: infer I
      }
      ? I
      : never
    : never

export type TablesUpdate<
  DefaultSchemaTableNameOrOptions extends
    | keyof DefaultSchema["Tables"]
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Update: infer U
    }
    ? U
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Update: infer U
      }
      ? U
      : never
    : never

export type Enums<
  DefaultSchemaEnumNameOrOptions extends
    | keyof DefaultSchema["Enums"]
    | { schema: keyof DatabaseWithoutInternals },
  EnumName extends DefaultSchemaEnumNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"]
    : never = never,
> = DefaultSchemaEnumNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"][EnumName]
  : DefaultSchemaEnumNameOrOptions extends keyof DefaultSchema["Enums"]
    ? DefaultSchema["Enums"][DefaultSchemaEnumNameOrOptions]
    : never

export type CompositeTypes<
  PublicCompositeTypeNameOrOptions extends
    | keyof DefaultSchema["CompositeTypes"]
    | { schema: keyof DatabaseWithoutInternals },
  CompositeTypeName extends PublicCompositeTypeNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"]
    : never = never,
> = PublicCompositeTypeNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"][CompositeTypeName]
  : PublicCompositeTypeNameOrOptions extends keyof DefaultSchema["CompositeTypes"]
    ? DefaultSchema["CompositeTypes"][PublicCompositeTypeNameOrOptions]
    : never

export const Constants = {
  public: {
    Enums: {},
  },
} as const
