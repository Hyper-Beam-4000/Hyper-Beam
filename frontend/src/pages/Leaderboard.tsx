import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { Badge } from "@/components/ui/badge";
import { Users, Calculator, Trophy } from "lucide-react";
import { useEffect, useState } from "react";
import { fetchLeaderboard, type LeaderboardEntry, type LeaderboardResponse } from "@/lib/api";

const fmt = (v: number | null | undefined) =>
  v != null ? (v * 100).toFixed(1) + "%" : "—";

const METRICS: { key: keyof LeaderboardEntry; label: string }[] = [
  { key: "overall_score",       label: "Overall" },
  { key: "answer_correctness",  label: "Answer" },
  { key: "rubric_score",        label: "Rubric" },
  { key: "embedding_similarity",label: "Embedding" },
  { key: "semantic_structure",  label: "Semantic" },
  { key: "lean_compiles",       label: "Lean ✓" },
  { key: "reasoning_alignment", label: "Reasoning" },
  { key: "lean_comparison",     label: "Lean Cmp" },
  { key: "proof_technique_match", label: "Technique" },
  { key: "concept_coverage",    label: "Coverage" },
];

const Leaderboard = () => {
  const [leaderboard, setLeaderboard] = useState<LeaderboardResponse | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    loadLeaderboard();
  }, []);

  const loadLeaderboard = async () => {
    setLoading(true);
    setError(null);
    try {
      const data = await fetchLeaderboard("demo-contest");
      setLeaderboard(data);
    } catch (err: any) {
      setError(err.message || "Failed to load leaderboard");
    } finally {
      setLoading(false);
    }
  };

  const entries = leaderboard?.entries ?? [];

  return (
    <div className="min-h-screen bg-background">
      <div className="container mx-auto px-4 py-8">
        <div className="mb-8">
          <div className="flex items-center gap-3 mb-2">
            <Calculator className="h-8 w-8 text-primary" />
            <h1 className="text-4xl font-bold">Math Benchmark Leaderboard</h1>
          </div>
          <p className="text-muted-foreground text-lg">
            Full metric breakdown — USAMO 2017–2025 benchmark
          </p>
        </div>

        <Card className="shadow-elevation-medium">
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <Users className="h-5 w-5" />
              {leaderboard?.contest_name ?? "Leaderboard"} ({entries.length})
            </CardTitle>
            <CardDescription>
              Ranked by overall weighted score across all 9 metrics
            </CardDescription>
          </CardHeader>
          <CardContent>
            {loading ? (
              <div className="text-center py-12">
                <p className="text-muted-foreground">Loading results...</p>
              </div>
            ) : error ? (
              <div className="text-center py-12">
                <p className="text-destructive">{error}</p>
              </div>
            ) : entries.length === 0 ? (
              <div className="text-center py-12">
                <Users className="h-16 w-16 mx-auto mb-4 text-muted-foreground" />
                <p className="text-muted-foreground">No completed evaluations yet</p>
                <p className="text-sm text-muted-foreground mt-1">
                  Submit a model and run evaluation to see results here
                </p>
              </div>
            ) : (
              <div className="overflow-x-auto">
                <Table>
                  <TableHeader>
                    <TableRow>
                      <TableHead className="w-[50px]">#</TableHead>
                      <TableHead>Model</TableHead>
                      <TableHead>Submitted</TableHead>
                      {METRICS.map((m) => (
                        <TableHead key={m.key} className="text-center whitespace-nowrap">
                          {m.label}
                        </TableHead>
                      ))}
                    </TableRow>
                  </TableHeader>
                  <TableBody>
                    {entries.map((entry) => (
                      <TableRow key={`${entry.rank}-${entry.model_name}`}>
                        <TableCell className="font-medium text-center">
                          {entry.rank === 1 ? (
                            <Trophy className="h-4 w-4 text-yellow-500 mx-auto" />
                          ) : entry.rank}
                        </TableCell>
                        <TableCell>
                          <Badge variant="outline">{entry.model_name}</Badge>
                        </TableCell>
                        <TableCell className="text-muted-foreground text-sm">
                          {entry.submitted_at ? new Date(entry.submitted_at).toLocaleDateString() : "—"}
                        </TableCell>
                        {METRICS.map((m) => (
                          <TableCell key={m.key} className="text-center font-mono text-sm">
                            {fmt(entry[m.key] as number | null | undefined)}
                          </TableCell>
                        ))}
                      </TableRow>
                    ))}
                  </TableBody>
                </Table>
              </div>
            )}
          </CardContent>
        </Card>
      </div>
    </div>
  );
};

export default Leaderboard;
