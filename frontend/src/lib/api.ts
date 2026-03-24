/**
 * Thin wrapper around fetch for calling the FastAPI backend.
 */

const API_URL = import.meta.env.VITE_API_URL || "http://localhost:8000";
let authToken: string | null = null;

export const setAuthToken = (token: string | null) => {
  authToken = token;
  if (token) localStorage.setItem("auth_token", token);
  else localStorage.removeItem("auth_token");
};

(() => {
  const saved = localStorage.getItem("auth_token");
  if (saved) authToken = saved;
})();

async function apiFetch<T>(path: string, options?: RequestInit): Promise<T> {
  const url = `${API_URL}${path}`;
  const res = await fetch(url, {
    headers: {
      "Content-Type": "application/json",
      ...(authToken ? { Authorization: `Bearer ${authToken}` } : {}),
      ...options?.headers,
    },
    ...options,
  });

  if (!res.ok) {
    const body = await res.json().catch(() => ({}));
    throw new Error(body.detail || `API error: ${res.status}`);
  }

  return res.json();
}

// ----- Problems -----

export interface Problem {
  id: string;
  title?: string | null;
  source?: string | null;
  url?: string | null;
  year?: number | null;
  problem_text?: string | null;
  solution_text?: string | null;
  problem_latex?: string | null;
  solution_latex?: string | null;
  lean_code?: string | null;
  scraped_at?: string | null;
  published_at?: string | null;
  tags?: string[];
  content_hash?: string;
}

export async function fetchProblems(params?: {
  limit?: number;
  last_key?: string;
  competition?: string;
  year?: number;
}): Promise<{ problems: Problem[]; next_key?: string }> {
  const query = new URLSearchParams();
  if (params?.limit) query.set("limit", String(params.limit));
  if (params?.last_key) query.set("last_key", params.last_key);
  if (params?.competition) query.set("competition", params.competition);
  if (params?.year) query.set("year", String(params.year));
  const qs = query.toString();
  return apiFetch(`/api/problems${qs ? `?${qs}` : ""}`);
}

export async function fetchProblem(id: string): Promise<Problem> {
  return apiFetch(`/api/problems/${id}`);
}

// ----- Contests -----

export interface Contest {
  id: string;
  name: string;
  description: string | null;
  start_date: string | null;
  end_date: string | null;
  is_active: boolean | null;
  created_at: string;
  problems?: Problem[];
}

export async function fetchContests(active?: boolean): Promise<{ contests: Contest[] }> {
  const qs = active !== undefined ? `?active=${active}` : "";
  return apiFetch(`/api/contests${qs}`);
}

export async function fetchContest(id: string): Promise<Contest> {
  return apiFetch(`/api/contests/${id}`);
}

// ----- Evaluations -----

export interface EvaluationResult {
  id: string;
  submission_id: string;
  problem_id: string;
  model_response: string | null;
  overall_score: number | null;
  answer_correctness: number | null;
  rubric_score: number | null;
  reasoning_alignment: number | null;
  embedding_similarity: number | null;
  proof_technique_match: number | null;
  concept_coverage: number | null;
  lean_compiles: boolean | null;
  lean_sorry_free: boolean | null;
  llm_judge_score: number | null;
  errors: unknown;
  evaluated_at: string;
  problems?: {
    title: string | null;
    competition: string | null;
    problem_number: number | null;
    difficulty: string | null;
  };
}

export async function fetchEvaluations(
  submissionId: string
): Promise<{ submission_id: string; results: EvaluationResult[] }> {
  return apiFetch(`/api/evaluations/${submissionId}`);
}

// ----- Leaderboard -----

export interface LeaderboardEntry {
  rank: number;
  team: string;
  model_name: string;
  evaluation_status: string | null;
  submitted_at: string;
  overall_score?: number | null;
  answer_correctness?: number | null;
  rubric_score?: number | null;
  reasoning_alignment?: number | null;
  embedding_similarity?: number | null;
  proof_technique_match?: number | null;
  concept_coverage?: number | null;
  semantic_structure?: number | null;
  lean_compiles?: number | null;
  lean_comparison?: number | null;
}

export interface LeaderboardResponse {
  contest_id: string;
  contest_name: string;
  contest_ended: boolean;
  entries: LeaderboardEntry[];
}

export async function fetchLeaderboard(contestId: string): Promise<LeaderboardResponse> {
  return apiFetch(`/api/leaderboard/${contestId}`);
}

// ----- Submissions -----

export interface Submission {
  id: string;
  model_name: string;
  api_endpoint: string;
  contest_id?: string;
  evaluation_status?: string | null;
  overall_score?: number | null;
  training_cutoff_date?: string | null;
  description?: string | null;
  created_at?: string;
  updated_at?: string;
}

export async function createSubmission(data: {
  model_name: string;
  api_endpoint: string;
  training_cutoff_date?: string;
  description?: string;
}): Promise<{ submission_id: string; status: string }> {
  return apiFetch("/api/submissions", {
    method: "POST",
    body: JSON.stringify(data),
  });
}

export async function listSubmissions(): Promise<{ submissions: Submission[] }> {
  return apiFetch("/api/submissions");
}

export async function fetchProgress(submissionId: string): Promise<{ scored: number; total: number; pct: number }> {
  return apiFetch(`/api/submissions/${submissionId}/progress`);
}

export async function triggerEvaluation(submissionId: string): Promise<{ status: string }> {
  return apiFetch(`/api/submissions/${submissionId}/evaluate`, { method: "POST" });
}

export async function cancelEvaluation(submissionId: string): Promise<{ status: string }> {
  return apiFetch(`/api/submissions/${submissionId}/cancel`, { method: "POST" });
}

export async function deleteSubmission(submissionId: string): Promise<{ status: string }> {
  return apiFetch(`/api/submissions/${submissionId}`, { method: "DELETE" });
}

export async function uploadResults(
  submissionId: string,
  file: File
): Promise<{ status: string; processed: number; errors: string[] }> {
  const formData = new FormData();
  formData.append("submission_id", submissionId);
  formData.append("file", file);

  const url = `${API_URL}/api/upload-results`;
  const res = await fetch(url, { method: "POST", body: formData });

  if (!res.ok) {
    const body = await res.json().catch(() => ({}));
    throw new Error(body.detail || `Upload error: ${res.status}`);
  }

  return res.json();
}

// ----- Auth (Dynamo-backed) -----
export async function register(email: string, password: string, teamName?: string) {
  const res = await apiFetch<{ token: string; email: string; team_name: string }>(
    "/api/auth/register",
    {
      method: "POST",
      body: JSON.stringify({ email, password, team_name: teamName }),
    }
  );
  setAuthToken(res.token);
  return res;
}

export async function login(email: string, password: string) {
  const res = await apiFetch<{ token: string; email: string; team_name: string }>(
    "/api/auth/login",
    {
      method: "POST",
      body: JSON.stringify({ email, password }),
    }
  );
  setAuthToken(res.token);
  return res;
}
