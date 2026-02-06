import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { BarChart3, Activity, Lock } from "lucide-react";
import { useEffect, useState } from "react";
import { supabase } from "@/integrations/supabase/client";
import { useAuth } from "@/contexts/AuthContext";

interface Submission {
  id: string;
  model_name: string;
  api_endpoint: string;
  created_at: string;
  is_active: boolean;
}

const Dashboard = () => {
  const { user } = useAuth();
  const [submissions, setSubmissions] = useState<Submission[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (user) {
      fetchSubmissions();
    }
  }, [user]);

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
    }
    setLoading(false);
  };

  const activeSubmission = submissions.find((s) => s.is_active);

  return (
    <div className="min-h-screen bg-background">
      <div className="container mx-auto px-4 py-8">
        <div className="mb-8">
          <div className="flex items-center gap-3 mb-2">
            <BarChart3 className="h-8 w-8 text-primary" />
            <h1 className="text-4xl font-bold">Performance Dashboard</h1>
          </div>
          <p className="text-muted-foreground text-lg">
            Track your submissions and view performance after contest ends
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
                    Submitted:{" "}
                    {new Date(activeSubmission.created_at).toLocaleDateString()}
                  </p>
                </>
              ) : (
                <p className="text-sm text-muted-foreground">
                  No active submission selected
                </p>
              )}
            </CardContent>
          </Card>

          <Card className="shadow-elevation-medium">
            <CardHeader className="pb-3">
              <CardTitle className="text-sm font-medium text-muted-foreground">
                Performance Metrics
              </CardTitle>
            </CardHeader>
            <CardContent>
              <div className="flex items-center gap-2 mb-2">
                <Lock className="h-6 w-6 text-muted-foreground" />
                <span className="text-lg font-semibold text-muted-foreground">Hidden</span>
              </div>
              <p className="text-xs text-muted-foreground">
                Scores revealed after contest
              </p>
            </CardContent>
          </Card>
        </div>

        {/* Contest Status Notice */}
        <Card className="mb-8 shadow-elevation-medium bg-muted/50 border-2 border-primary/20">
          <CardContent className="pt-6">
            <div className="flex items-start gap-3">
              <Lock className="h-5 w-5 text-primary flex-shrink-0 mt-0.5" />
              <div>
                <h3 className="font-semibold mb-1">Performance Metrics Locked</h3>
                <p className="text-sm text-muted-foreground">
                  To prevent gaming the benchmark, all performance metrics, scores, and rankings
                  are hidden during the active contest period. Detailed analytics and
                  leaderboard positions will be revealed when the contest concludes.
                </p>
              </div>
            </div>
          </CardContent>
        </Card>

        {/* Submission History */}
        <Card className="shadow-elevation-medium">
          <CardHeader>
            <CardTitle>Submission History</CardTitle>
            <CardDescription>
              Your past submissions - scores will appear after contest ends
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
                <p className="text-sm text-muted-foreground">
                  Submit your first model to get started
                </p>
              </div>
            ) : (
              <div className="space-y-4">
                {submissions.map((submission) => (
                  <div
                    key={submission.id}
                    className="flex items-center justify-between p-4 rounded-lg bg-muted/30 hover:bg-muted/50 transition-colors border border-border"
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
                    <Badge
                      variant={submission.is_active ? "default" : "secondary"}
                      className={submission.is_active ? "bg-success" : ""}
                    >
                      {submission.is_active ? "Active" : "Inactive"}
                    </Badge>
                  </div>
                ))}
              </div>
            )}
          </CardContent>
        </Card>
      </div>
    </div>
  );
};

export default Dashboard;
