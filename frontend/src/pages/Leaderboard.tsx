import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { Badge } from "@/components/ui/badge";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { Users, Lock, Calculator } from "lucide-react";
import { useEffect, useState } from "react";
import { fetchContests, fetchLeaderboard, type Contest, type LeaderboardEntry, type LeaderboardResponse } from "@/lib/api";
import { supabase } from "@/integrations/supabase/client";

const Leaderboard = () => {
  const [contests, setContests] = useState<Contest[]>([]);
  const [selectedContest, setSelectedContest] = useState<string>("");
  const [leaderboard, setLeaderboard] = useState<LeaderboardResponse | null>(null);
  const [loading, setLoading] = useState(true);
  const [usingFallback, setUsingFallback] = useState(false);

  // Fallback data for when API isn't available
  const [fallbackSubmissions, setFallbackSubmissions] = useState<any[]>([]);

  useEffect(() => {
    loadContests();
  }, []);

  useEffect(() => {
    if (selectedContest) {
      loadLeaderboard(selectedContest);
    }
  }, [selectedContest]);

  const loadContests = async () => {
    try {
      const data = await fetchContests();
      setContests(data.contests);
      if (data.contests.length > 0) {
        const active = data.contests.find((c) => c.is_active) || data.contests[0];
        setSelectedContest(active.id);
      }
    } catch {
      // API not available — fall back to direct Supabase query
      setUsingFallback(true);
      loadFallbackSubmissions();
    }
  };

  const loadLeaderboard = async (contestId: string) => {
    setLoading(true);
    try {
      const data = await fetchLeaderboard(contestId);
      setLeaderboard(data);
    } catch {
      setUsingFallback(true);
      loadFallbackSubmissions();
    } finally {
      setLoading(false);
    }
  };

  const loadFallbackSubmissions = async () => {
    setLoading(true);
    const { data, error } = await supabase
      .from("submissions")
      .select("id, model_name, created_at, is_active, user_id, evaluation_status, overall_score")
      .eq("is_active", true)
      .order("created_at", { ascending: false });

    if (!error && data) {
      const withProfiles = await Promise.all(
        data.map(async (sub) => {
          const { data: profile } = await supabase
            .from("profiles")
            .select("team_name, email")
            .eq("id", sub.user_id)
            .single();
          return { ...sub, profiles: profile };
        })
      );
      setFallbackSubmissions(withProfiles);
    }
    setLoading(false);
  };

  const contestEnded = leaderboard?.contest_ended ?? false;

  return (
    <div className="min-h-screen bg-background">
      <div className="container mx-auto px-4 py-8">
        <div className="mb-8">
          <div className="flex items-center gap-3 mb-2">
            <Calculator className="h-8 w-8 text-primary" />
            <h1 className="text-4xl font-bold">Math Benchmark Leaderboard</h1>
          </div>
          <p className="text-muted-foreground text-lg">
            {contestEnded
              ? "Final results — full metric breakdown visible"
              : "Current active submissions — scores will be revealed after the contest ends"
            }
          </p>
        </div>

        {/* Contest selector */}
        {contests.length > 0 && (
          <div className="mb-6">
            <Select value={selectedContest} onValueChange={setSelectedContest}>
              <SelectTrigger className="w-[300px]">
                <SelectValue placeholder="Select contest" />
              </SelectTrigger>
              <SelectContent>
                {contests.map((c) => (
                  <SelectItem key={c.id} value={c.id}>
                    {c.name} {c.is_active ? "(Active)" : ""}
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>
          </div>
        )}

        {!contestEnded && (
          <Card className="mb-6 bg-muted/50 border-2 border-primary/20">
            <CardContent className="pt-6">
              <div className="flex items-start gap-3">
                <Lock className="h-5 w-5 text-primary flex-shrink-0 mt-0.5" />
                <div>
                  <h3 className="font-semibold mb-1">Scores Hidden During Contest</h3>
                  <p className="text-sm text-muted-foreground">
                    To prevent gaming the system, all performance metrics are hidden until the contest concludes.
                    Only submission existence and timing are visible during the active period.
                  </p>
                </div>
              </div>
            </CardContent>
          </Card>
        )}

        <Card className="shadow-elevation-medium">
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <Users className="h-5 w-5" />
              {usingFallback
                ? `Active Submissions (${fallbackSubmissions.length})`
                : `${leaderboard?.contest_name || "Leaderboard"} (${leaderboard?.entries.length ?? 0})`
              }
            </CardTitle>
            <CardDescription>
              {contestEnded
                ? "Final rankings with full metric breakdown"
                : "Teams that have submitted models to the current contest"
              }
            </CardDescription>
          </CardHeader>
          <CardContent>
            {loading ? (
              <div className="text-center py-12">
                <p className="text-muted-foreground">Loading submissions...</p>
              </div>
            ) : usingFallback ? (
              // Fallback rendering (direct Supabase)
              fallbackSubmissions.length === 0 ? (
                <div className="text-center py-12">
                  <Users className="h-16 w-16 mx-auto mb-4 text-muted-foreground" />
                  <p className="text-muted-foreground">No submissions yet</p>
                </div>
              ) : (
                <div className="overflow-x-auto">
                  <Table>
                    <TableHeader>
                      <TableRow>
                        <TableHead className="w-[80px]">#</TableHead>
                        <TableHead>Team</TableHead>
                        <TableHead>Model Name</TableHead>
                        <TableHead>Submitted</TableHead>
                        <TableHead className="text-center">Status</TableHead>
                      </TableRow>
                    </TableHeader>
                    <TableBody>
                      {fallbackSubmissions.map((sub, index) => (
                        <TableRow key={sub.id}>
                          <TableCell className="font-medium text-center">{index + 1}</TableCell>
                          <TableCell className="font-semibold">
                            {sub.profiles?.team_name || "Anonymous"}
                          </TableCell>
                          <TableCell><Badge variant="outline">{sub.model_name}</Badge></TableCell>
                          <TableCell className="text-muted-foreground">
                            {new Date(sub.created_at).toLocaleDateString()}
                          </TableCell>
                          <TableCell className="text-center">
                            <Badge className="bg-success">Submitted</Badge>
                          </TableCell>
                        </TableRow>
                      ))}
                    </TableBody>
                  </Table>
                </div>
              )
            ) : (
              // API-powered rendering
              (leaderboard?.entries.length ?? 0) === 0 ? (
                <div className="text-center py-12">
                  <Users className="h-16 w-16 mx-auto mb-4 text-muted-foreground" />
                  <p className="text-muted-foreground">No submissions yet</p>
                </div>
              ) : (
                <div className="overflow-x-auto">
                  <Table>
                    <TableHeader>
                      <TableRow>
                        <TableHead className="w-[80px]">#</TableHead>
                        <TableHead>Team</TableHead>
                        <TableHead>Model Name</TableHead>
                        <TableHead>Submitted</TableHead>
                        {contestEnded && (
                          <>
                            <TableHead className="text-center">Overall</TableHead>
                            <TableHead className="text-center">Answer</TableHead>
                            <TableHead className="text-center">Rubric</TableHead>
                            <TableHead className="text-center">Reasoning</TableHead>
                            <TableHead className="text-center">Embedding</TableHead>
                            <TableHead className="text-center">Technique</TableHead>
                            <TableHead className="text-center">Coverage</TableHead>
                          </>
                        )}
                        {!contestEnded && (
                          <TableHead className="text-center">Status</TableHead>
                        )}
                      </TableRow>
                    </TableHeader>
                    <TableBody>
                      {leaderboard!.entries.map((entry) => (
                        <TableRow key={`${entry.rank}-${entry.model_name}`}>
                          <TableCell className="font-medium text-center">{entry.rank}</TableCell>
                          <TableCell className="font-semibold">{entry.team}</TableCell>
                          <TableCell><Badge variant="outline">{entry.model_name}</Badge></TableCell>
                          <TableCell className="text-muted-foreground">
                            {new Date(entry.submitted_at).toLocaleDateString()}
                          </TableCell>
                          {contestEnded && (
                            <>
                              <TableCell className="text-center font-semibold">
                                {entry.overall_score?.toFixed(3) ?? "-"}
                              </TableCell>
                              <TableCell className="text-center">
                                {entry.answer_correctness?.toFixed(3) ?? "-"}
                              </TableCell>
                              <TableCell className="text-center">
                                {entry.rubric_score?.toFixed(3) ?? "-"}
                              </TableCell>
                              <TableCell className="text-center">
                                {entry.reasoning_alignment?.toFixed(3) ?? "-"}
                              </TableCell>
                              <TableCell className="text-center">
                                {entry.embedding_similarity?.toFixed(3) ?? "-"}
                              </TableCell>
                              <TableCell className="text-center">
                                {entry.proof_technique_match?.toFixed(3) ?? "-"}
                              </TableCell>
                              <TableCell className="text-center">
                                {entry.concept_coverage?.toFixed(3) ?? "-"}
                              </TableCell>
                            </>
                          )}
                          {!contestEnded && (
                            <TableCell className="text-center">
                              <Badge className="bg-success">Submitted</Badge>
                            </TableCell>
                          )}
                        </TableRow>
                      ))}
                    </TableBody>
                  </Table>
                </div>
              )
            )}
          </CardContent>
        </Card>
      </div>
    </div>
  );
};

export default Leaderboard;
