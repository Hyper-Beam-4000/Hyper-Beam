import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { BarChart3, Activity, Lock, TrendingUp } from "lucide-react";
import { useEffect, useState } from "react";
import { supabase } from "@/integrations/supabase/client";
import { useAuth } from "@/contexts/AuthContext";
import { fetchEvaluations, fetchProblems, type EvaluationResult, type Problem } from "@/lib/api";
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer, RadarChart, PolarGrid, PolarAngleAxis, PolarRadiusAxis, Radar } from "recharts";

interface Submission {
  id: string;
  model_name: string;
  api_endpoint: string;
  created_at: string;
  is_active: boolean;
  evaluation_status: string | null;
  overall_score: number | null;
  answer_correctness: number | null;
  rubric_score: number | null;
  reasoning_alignment: number | null;
  embedding_similarity: number | null;
  proof_technique_match: number | null;
  concept_coverage: number | null;
}

const statusBadge: Record<string, { label: string; className: string }> = {
  pending: { label: "Pending", className: "bg-gray-500/20 text-gray-700" },
  queued: { label: "Queued", className: "bg-yellow-500/20 text-yellow-700" },
  running: { label: "Running", className: "bg-blue-500/20 text-blue-700" },
  completed: { label: "Completed", className: "bg-green-500/20 text-green-700" },
  failed: { label: "Failed", className: "bg-red-500/20 text-red-700" },
};

const Dashboard = () => {
  const { user } = useAuth();
  const [submissions, setSubmissions] = useState<Submission[]>([]);
  const [loading, setLoading] = useState(true);
  const [selectedSubmission, setSelectedSubmission] = useState<string | null>(null);
  const [evalResults, setEvalResults] = useState<EvaluationResult[]>([]);
  const [evalLoading, setEvalLoading] = useState(false);
  const [recentProblems, setRecentProblems] = useState<Problem[]>([]);
  const [problemsLoading, setProblemsLoading] = useState(true);

  useEffect(() => {
    if (user) {
      fetchSubmissions();
    }
  }, [user]);

  useEffect(() => {
    loadProblems();
  }, []);

  useEffect(() => {
    if (selectedSubmission) {
      loadEvaluations(selectedSubmission);
    }
  }, [selectedSubmission]);

  const fetchSubmissions = async () => {
    const { data, error } = await supabase
      .from("submissions")
      .select("*")
      .eq("user_id", user?.id)
      .order("created_at", { ascending: false });

    if (error) {
      console.error("Error fetching submissions:", error);
    } else {
      setSubmissions(data || []);
      const active = data?.find((s: any) => s.is_active);
      if (active) {
        setSelectedSubmission(active.id);
      }
    }
    setLoading(false);
  };

  const loadEvaluations = async (submissionId: string) => {
    setEvalLoading(true);
    try {
      const data = await fetchEvaluations(submissionId);
      setEvalResults(data.results);
    } catch {
      setEvalResults([]);
    } finally {
      setEvalLoading(false);
    }
  };

  const loadProblems = async () => {
    setProblemsLoading(true);
    try {
      const data = await fetchProblems({ limit: 5 });
      setRecentProblems(data.problems || []);
    } catch (e) {
      setRecentProblems([]);
    } finally {
      setProblemsLoading(false);
    }
  };

  const activeSubmission = submissions.find((s) => s.is_active);

  // Prepare chart data from active submission
  const metricChartData = activeSubmission
    ? [
        { metric: "Answer", value: activeSubmission.answer_correctness },
        { metric: "Rubric", value: activeSubmission.rubric_score },
        { metric: "Reasoning", value: activeSubmission.reasoning_alignment },
        { metric: "Embedding", value: activeSubmission.embedding_similarity },
        { metric: "Technique", value: activeSubmission.proof_technique_match },
        { metric: "Coverage", value: activeSubmission.concept_coverage },
      ].filter((d) => d.value != null)
    : [];

  const radarData = metricChartData.map((d) => ({
    metric: d.metric,
    score: Number(((d.value ?? 0) * 100).toFixed(1)),
  }));

  const hasScores = metricChartData.length > 0;

  return (
    <div className="min-h-screen bg-background">
      <div className="container mx-auto px-4 py-8">
        <div className="mb-8">
          <div className="flex items-center gap-3 mb-2">
            <BarChart3 className="h-8 w-8 text-primary" />
            <h1 className="text-4xl font-bold">Performance Dashboard</h1>
          </div>
          <p className="text-muted-foreground text-lg">
            Track your submissions and view detailed performance metrics
          </p>
        </div>

        {/* Stats Overview */}
        <div className="grid md:grid-cols-3 gap-6 mb-8">
          <Card className="shadow-elevation-medium">
            <CardHeader className="pb-3">
              <CardTitle className="text-sm font-medium text-muted-foreground">
                Total Submissions
              </CardTitle>
            </CardHeader>
            <CardContent>
              <div className="flex items-center gap-2">
                <Activity className="h-8 w-8 text-secondary" />
                <span className="text-3xl font-bold">{submissions.length}</span>
              </div>
              <p className="text-xs text-muted-foreground mt-2">
                {activeSubmission ? "1 active on leaderboard" : "No active submission"}
              </p>
            </CardContent>
          </Card>

          <Card className="shadow-elevation-medium">
            <CardHeader className="pb-3">
              <CardTitle className="text-sm font-medium text-muted-foreground">
                Active Submission
              </CardTitle>
            </CardHeader>
            <CardContent>
              {activeSubmission ? (
                <>
                  <Badge className="mb-2 bg-success">Active</Badge>
                  <p className="text-sm font-semibold">{activeSubmission.model_name}</p>
                  <p className="text-xs text-muted-foreground mt-1">
                    {statusBadge[activeSubmission.evaluation_status || "pending"]?.label || "Pending"}
                  </p>
                </>
              ) : (
                <p className="text-sm text-muted-foreground">No active submission selected</p>
              )}
            </CardContent>
          </Card>

          <Card className="shadow-elevation-medium">
            <CardHeader className="pb-3">
              <CardTitle className="text-sm font-medium text-muted-foreground">
                Overall Score
              </CardTitle>
            </CardHeader>
            <CardContent>
              {hasScores ? (
                <>
                  <div className="flex items-center gap-2 mb-2">
                    <TrendingUp className="h-6 w-6 text-primary" />
                    <span className="text-3xl font-bold">
                      {((activeSubmission?.overall_score ?? 0) * 100).toFixed(1)}%
                    </span>
                  </div>
                  <p className="text-xs text-muted-foreground">
                    Across {evalResults.length} problems
                  </p>
                </>
              ) : (
                <>
                  <div className="flex items-center gap-2 mb-2">
                    <Lock className="h-6 w-6 text-muted-foreground" />
                    <span className="text-lg font-semibold text-muted-foreground">Pending</span>
                  </div>
                  <p className="text-xs text-muted-foreground">
                    Scores appear after evaluation
                  </p>
                </>
              )}
            </CardContent>
          </Card>
        </div>

        {/* Metric Breakdown Charts */}
        {hasScores && (
          <div className="grid md:grid-cols-2 gap-6 mb-8">
            <Card className="shadow-elevation-medium">
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <BarChart3 className="h-5 w-5 text-primary" />
                  Per-Metric Scores
                </CardTitle>
              </CardHeader>
              <CardContent>
                <ResponsiveContainer width="100%" height={300}>
                  <BarChart data={radarData}>
                    <CartesianGrid strokeDasharray="3 3" />
                    <XAxis dataKey="metric" tick={{ fontSize: 12 }} />
                    <YAxis domain={[0, 100]} tick={{ fontSize: 12 }} />
                    <Tooltip formatter={(v: number) => `${v}%`} />
                    <Bar dataKey="score" fill="hsl(var(--primary))" radius={[4, 4, 0, 0]} />
                  </BarChart>
                </ResponsiveContainer>
              </CardContent>
            </Card>

            <Card className="shadow-elevation-medium">
              <CardHeader>
                <CardTitle>Metric Radar</CardTitle>
              </CardHeader>
              <CardContent>
                <ResponsiveContainer width="100%" height={300}>
                  <RadarChart data={radarData}>
                    <PolarGrid />
                    <PolarAngleAxis dataKey="metric" tick={{ fontSize: 11 }} />
                    <PolarRadiusAxis domain={[0, 100]} tick={{ fontSize: 10 }} />
                    <Radar
                      dataKey="score"
                      stroke="hsl(var(--primary))"
                      fill="hsl(var(--primary))"
                      fillOpacity={0.3}
                    />
                  </RadarChart>
                </ResponsiveContainer>
              </CardContent>
            </Card>
          </div>
        )}

        {/* Per-Problem Results */}
        {evalResults.length > 0 && (
          <Card className="mb-8 shadow-elevation-medium">
            <CardHeader>
              <CardTitle>Per-Problem Results</CardTitle>
              <CardDescription>
                Detailed breakdown for each evaluated problem
              </CardDescription>
            </CardHeader>
            <CardContent>
              <div className="overflow-x-auto">
                <Table>
                  <TableHeader>
                    <TableRow>
                      <TableHead>Problem</TableHead>
                      <TableHead className="text-center">Overall</TableHead>
                      <TableHead className="text-center">Answer</TableHead>
                      <TableHead className="text-center">Rubric</TableHead>
                      <TableHead className="text-center">Reasoning</TableHead>
                      <TableHead className="text-center">Semantic</TableHead>
                      <TableHead className="text-center">Embedding</TableHead>
                      <TableHead className="text-center">Lean ✓</TableHead>
                      <TableHead className="text-center">Lean Cmp</TableHead>
                    </TableRow>
                  </TableHeader>
                  <TableBody>
                    {evalResults.map((result) => (
                      <TableRow key={result.id}>
                        <TableCell className="font-medium">
                          {result.problems?.title || `Problem ${result.problem_id.substring(0, 8)}`}
                          {result.problems?.difficulty && (
                            <Badge variant="outline" className="ml-2">{result.problems.difficulty}</Badge>
                          )}
                        </TableCell>
                        <TableCell className="text-center font-semibold">
                          {result.overall_score?.toFixed(3) ?? "-"}
                        </TableCell>
                        <TableCell className="text-center">
                          {result.answer_correctness != null
                            ? result.answer_correctness >= 0.5 ? "Correct" : "Wrong"
                            : "-"}
                        </TableCell>
                        <TableCell className="text-center">
                          {result.rubric_score?.toFixed(3) ?? "-"}
                        </TableCell>
                        <TableCell className="text-center">
                          {result.reasoning_alignment?.toFixed(3) ?? "-"}
                        </TableCell>
                        <TableCell className="text-center">
                          {result.semantic_structure?.toFixed(3) ?? "-"}
                        </TableCell>
                        <TableCell className="text-center">
                          {result.embedding_similarity?.toFixed(3) ?? "-"}
                        </TableCell>
                        <TableCell className="text-center">
                          {result.lean_compiles != null
                            ? result.lean_compiles ? "✓" : "✗"
                            : "-"}
                        </TableCell>
                        <TableCell className="text-center">
                          {result.lean_comparison?.toFixed(3) ?? "-"}
                        </TableCell>
                      </TableRow>
                    ))}
                  </TableBody>
                </Table>
              </div>
            </CardContent>
          </Card>
        )}

        {/* Recent Scraped Problems (Dynamo) */}
        <Card className="mb-8 shadow-elevation-medium">
          <CardHeader>
            <CardTitle>Recent Scraped Problems</CardTitle>
            <CardDescription>
              Pulled from DynamoDB via the backend problems API
            </CardDescription>
          </CardHeader>
          <CardContent>
            {problemsLoading ? (
              <p className="text-muted-foreground">Loading problems...</p>
            ) : recentProblems.length === 0 ? (
              <p className="text-muted-foreground">No problems found. Run the scraper to populate data.</p>
            ) : (
              <div className="overflow-x-auto">
                <Table>
                  <TableHeader>
                    <TableRow>
                      <TableHead>Title</TableHead>
                      <TableHead>Source</TableHead>
                      <TableHead>Scraped</TableHead>
                    </TableRow>
                  </TableHeader>
                  <TableBody>
                    {recentProblems.map((p) => (
                      <TableRow key={p.id}>
                        <TableCell className="font-semibold">{p.title || p.id}</TableCell>
                        <TableCell>{p.source || "Unknown"}</TableCell>
                        <TableCell className="text-muted-foreground text-sm">
                          {p.scraped_at ? new Date(p.scraped_at).toLocaleString() : "–"}
                        </TableCell>
                      </TableRow>
                    ))}
                  </TableBody>
                </Table>
              </div>
            )}
          </CardContent>
        </Card>

        {/* Submission History */}
        <Card className="shadow-elevation-medium">
          <CardHeader>
            <CardTitle>Submission History</CardTitle>
            <CardDescription>
              Click a submission to view its per-problem results
            </CardDescription>
          </CardHeader>
          <CardContent>
            {loading ? (
              <div className="text-center py-12">
                <p className="text-muted-foreground">Loading submissions...</p>
              </div>
            ) : submissions.length === 0 ? (
              <div className="text-center py-12">
                <Activity className="h-16 w-16 mx-auto mb-4 text-muted-foreground" />
                <p className="text-muted-foreground">No submissions yet</p>
              </div>
            ) : (
              <div className="space-y-4">
                {submissions.map((submission) => {
                  const status = statusBadge[submission.evaluation_status || "pending"] || statusBadge.pending;
                  const isSelected = selectedSubmission === submission.id;
                  return (
                    <div
                      key={submission.id}
                      className={`flex items-center justify-between p-4 rounded-lg transition-colors border cursor-pointer ${
                        isSelected
                          ? "bg-primary/5 border-primary"
                          : "bg-muted/30 hover:bg-muted/50 border-border"
                      }`}
                      onClick={() => setSelectedSubmission(submission.id)}
                    >
                      <div className="flex flex-col">
                        <span className="font-semibold">{submission.model_name}</span>
                        <span className="text-sm text-muted-foreground truncate max-w-md">
                          {submission.api_endpoint}
                        </span>
                        <span className="text-xs text-muted-foreground mt-1">
                          {new Date(submission.created_at).toLocaleDateString()}
                        </span>
                      </div>
                      <div className="flex items-center gap-2">
                        {submission.overall_score != null && (
                          <Badge variant="secondary">
                            {(submission.overall_score * 100).toFixed(1)}%
                          </Badge>
                        )}
                        <Badge className={status.className}>{status.label}</Badge>
                        <Badge
                          variant={submission.is_active ? "default" : "secondary"}
                          className={submission.is_active ? "bg-success" : ""}
                        >
                          {submission.is_active ? "Active" : "Inactive"}
                        </Badge>
                      </div>
                    </div>
                  );
                })}
              </div>
            )}
          </CardContent>
        </Card>
      </div>
    </div>
  );
};

export default Dashboard;
