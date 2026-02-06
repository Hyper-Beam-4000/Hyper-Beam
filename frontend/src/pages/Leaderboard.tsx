import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { Badge } from "@/components/ui/badge";
import { TrendingUp, Users, Lock, Calculator } from "lucide-react";
import { useEffect, useState } from "react";
import { supabase } from "@/integrations/supabase/client";

interface Submission {
  id: string;
  model_name: string;
  created_at: string;
  profiles: {
    team_name: string | null;
    email: string;
  } | null;
}

const Leaderboard = () => {
  const [submissions, setSubmissions] = useState<Submission[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchSubmissions = async () => {
      const { data, error } = await supabase
        .from("submissions")
        .select("id, model_name, created_at, is_active, user_id")
        .eq("is_active", true)
        .order("created_at", { ascending: false });

      if (error) {
        console.error("Error fetching submissions:", error);
        setLoading(false);
        return;
      }

      // Fetch profiles for each submission
      const submissionsWithProfiles = await Promise.all(
        (data || []).map(async (submission) => {
          const { data: profile } = await supabase
            .from("profiles")
            .select("team_name, email")
            .eq("id", submission.user_id)
            .single();

          return {
            ...submission,
            profiles: profile,
          };
        })
      );

      setSubmissions(submissionsWithProfiles as any);
      setLoading(false);
    };

    fetchSubmissions();
  }, []);

  return (
    <div className="min-h-screen bg-background">
      <div className="container mx-auto px-4 py-8">
        <div className="mb-8">
          <div className="flex items-center gap-3 mb-2">
            <Calculator className="h-8 w-8 text-primary" />
            <h1 className="text-4xl font-bold">Math Benchmark Leaderboard</h1>
          </div>
          <p className="text-muted-foreground text-lg">
            Current active submissions - scores will be revealed after the contest ends
          </p>
        </div>

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

        <Card className="shadow-elevation-medium">
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <Users className="h-5 w-5" />
              Active Submissions ({submissions.length})
            </CardTitle>
            <CardDescription>
              Teams that have submitted models to the current contest
            </CardDescription>
          </CardHeader>
          <CardContent>
            {loading ? (
              <div className="text-center py-12">
                <p className="text-muted-foreground">Loading submissions...</p>
              </div>
            ) : submissions.length === 0 ? (
              <div className="text-center py-12">
                <Users className="h-16 w-16 mx-auto mb-4 text-muted-foreground" />
                <p className="text-muted-foreground">No submissions yet</p>
                <p className="text-sm text-muted-foreground">
                  Be the first to submit your model!
                </p>
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
                    {submissions.map((submission, index) => (
                      <TableRow key={submission.id} className="hover:bg-muted/50 transition-colors">
                        <TableCell className="font-medium text-center">
                          {index + 1}
                        </TableCell>
                        <TableCell className="font-semibold">
                          {submission.profiles?.team_name || "Anonymous"}
                        </TableCell>
                        <TableCell>
                          <Badge variant="outline">{submission.model_name}</Badge>
                        </TableCell>
                        <TableCell className="text-muted-foreground">
                          {new Date(submission.created_at).toLocaleDateString()}
                        </TableCell>
                        <TableCell className="text-center">
                          <Badge className="bg-success">Submitted</Badge>
                        </TableCell>
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
