import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Textarea } from "@/components/ui/textarea";
import { Badge } from "@/components/ui/badge";
import { Upload, Link as LinkIcon, AlertCircle, CheckCircle2, Archive } from "lucide-react";
import { useState, useEffect } from "react";
import { useSearchParams } from "react-router-dom";
import { useToast } from "@/hooks/use-toast";
import { RadioGroup, RadioGroupItem } from "@/components/ui/radio-group";
import { supabase } from "@/integrations/supabase/client";
import { useAuth } from "@/contexts/AuthContext";

const archivedContests: Record<string, { name: string; period: string }> = {
  "1": { name: "Q3 2025 LLM Benchmark Challenge", period: "August 1 - September 30, 2025" },
  "2": { name: "Q2 2025 Safety & Alignment Contest", period: "May 1 - June 30, 2025" },
  "3": { name: "Q1 2025 Multimodal Evaluation", period: "February 1 - March 31, 2025" },
  "4": { name: "Q4 2024 General Performance Benchmark", period: "November 1 - December 31, 2024" },
};

interface Submission {
  id: string;
  model_name: string;
  api_endpoint: string;
  created_at: string;
  is_active: boolean;
}

const Submit = () => {
  const { toast } = useToast();
  const { user } = useAuth();
  const [searchParams] = useSearchParams();
  const [loading, setLoading] = useState(false);
  const [submissions, setSubmissions] = useState<Submission[]>([]);
  const [activeSubmission, setActiveSubmission] = useState<string | null>(null);

  const archiveContestId = searchParams.get("archive");
  const archiveContest = archiveContestId ? archivedContests[archiveContestId] : null;

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
      const active = data?.find((s) => s.is_active);
      if (active) {
        setActiveSubmission(active.id);
      }
    }
  };

  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setLoading(true);

    const formData = new FormData(e.currentTarget);
    const modelName = formData.get("model-name") as string;
    const apiEndpoint = formData.get("api-endpoint") as string;
    const description = formData.get("description") as string;

    const { error } = await supabase.from("submissions").insert({
      user_id: user?.id,
      model_name: modelName,
      api_endpoint: apiEndpoint,
      description: description || null,
      is_active: submissions.length === 0, // First submission is automatically active
    });

    setLoading(false);

    if (error) {
      toast({
        title: "Submission Failed",
        description: error.message,
        variant: "destructive",
      });
    } else {
      toast({
        title: "Submission Received",
        description: "Your model API has been registered for evaluation.",
      });
      (e.target as HTMLFormElement).reset();
      fetchSubmissions();
    }
  };

  const handleSetActive = async (submissionId: string) => {
    // Deactivate all submissions
    await supabase
      .from("submissions")
      .update({ is_active: false })
      .eq("user_id", user?.id);

    // Activate selected submission
    const { error } = await supabase
      .from("submissions")
      .update({ is_active: true })
      .eq("id", submissionId);

    if (error) {
      toast({
        title: "Error",
        description: error.message,
        variant: "destructive",
      });
    } else {
      setActiveSubmission(submissionId);
      toast({
        title: "Active Submission Updated",
        description: "This submission is now your active leaderboard entry.",
      });
      fetchSubmissions();
    }
  };

  return (
    <div className="min-h-screen bg-background">
      <div className="container mx-auto px-4 py-8">
        <div className="mb-8">
          <div className="flex items-center gap-3 mb-2">
            {archiveContest ? (
              <Archive className="h-8 w-8 text-primary" />
            ) : (
              <Upload className="h-8 w-8 text-primary" />
            )}
            <h1 className="text-4xl font-bold">
              {archiveContest ? "Submit to Archive" : "Submit Model"}
            </h1>
          </div>
          <p className="text-muted-foreground text-lg">
            {archiveContest 
              ? "Submit your model for non-competitive evaluation against historical results"
              : "Submit your model API endpoint for evaluation"
            }
          </p>
        </div>

        {archiveContest && (
          <div className="mb-6 p-4 rounded-lg bg-primary/10 border border-primary/20">
            <div className="flex items-start gap-3">
              <Archive className="h-5 w-5 text-primary flex-shrink-0 mt-0.5" />
              <div>
                <h3 className="font-semibold mb-1">{archiveContest.name}</h3>
                <p className="text-sm text-muted-foreground">
                  {archiveContest.period} • Non-competitive submission - results won't appear on the official leaderboard
                </p>
              </div>
            </div>
          </div>
        )}

        <div className="grid lg:grid-cols-2 gap-8">
          {/* Submission Form */}
          <Card className="shadow-elevation-medium">
            <CardHeader>
              <CardTitle>New Submission</CardTitle>
              <CardDescription>
                Provide your model's API endpoint for evaluation
              </CardDescription>
            </CardHeader>
            <CardContent>
              <form onSubmit={handleSubmit} className="space-y-6">
                <div className="space-y-2">
                  <Label htmlFor="model-name">Model Name</Label>
                  <Input
                    id="model-name"
                    name="model-name"
                    placeholder="e.g., GPT-Eval-v1.3"
                    required
                  />
                </div>

                <div className="space-y-2">
                  <Label htmlFor="api-endpoint">API Endpoint URL</Label>
                  <div className="relative">
                    <LinkIcon className="absolute left-3 top-3 h-4 w-4 text-muted-foreground" />
                    <Input
                      id="api-endpoint"
                      name="api-endpoint"
                      type="url"
                      placeholder="https://api.example.com/v1/evaluate"
                      className="pl-10"
                      required
                    />
                  </div>
                  <p className="text-xs text-muted-foreground">
                    The endpoint will be called with evaluation requests during the contest
                  </p>
                </div>

                <div className="space-y-2">
                  <Label htmlFor="description">Description (Optional)</Label>
                  <Textarea
                    id="description"
                    name="description"
                    placeholder="Briefly describe your model or approach..."
                    rows={3}
                  />
                </div>

                <div className="bg-muted/50 rounded-lg p-4 border border-border">
                  <div className="flex gap-2 mb-2">
                    <AlertCircle className="h-5 w-5 text-primary flex-shrink-0 mt-0.5" />
                    <div>
                      <h4 className="font-semibold mb-1">API Requirements</h4>
                      <ul className="text-sm text-muted-foreground space-y-1">
                        <li>• Endpoint must accept POST requests with JSON payload</li>
                        <li>• Must return evaluation results in specified format</li>
                        <li>• Authentication headers will be provided during setup</li>
                        <li>• Response time should be under 30 seconds per request</li>
                      </ul>
                    </div>
                  </div>
                </div>

                <Button
                  type="submit"
                  className="w-full bg-gradient-hero text-white hover:opacity-90"
                  disabled={loading}
                >
                  {loading ? "Submitting..." : "Submit Model API"}
                </Button>
              </form>
            </CardContent>
          </Card>

          {/* Previous Submissions */}
          <Card className="shadow-elevation-medium">
            <CardHeader>
              <CardTitle>Your Submissions</CardTitle>
              <CardDescription>
                Select which submission appears on the leaderboard
              </CardDescription>
            </CardHeader>
            <CardContent>
              {submissions.length === 0 ? (
                <div className="text-center py-12">
                  <LinkIcon className="h-16 w-16 mx-auto mb-4 text-muted-foreground" />
                  <p className="text-muted-foreground">No submissions yet</p>
                  <p className="text-sm text-muted-foreground">
                    Submit your first model API to get started
                  </p>
                </div>
              ) : (
                <RadioGroup
                  value={activeSubmission || ""}
                  onValueChange={handleSetActive}
                >
                  <div className="space-y-4">
                    {submissions.map((submission) => (
                      <div
                        key={submission.id}
                        className={`p-4 rounded-lg border-2 transition-all ${
                          submission.is_active
                            ? "border-primary bg-primary/5"
                            : "border-border bg-card hover:border-primary/30"
                        }`}
                      >
                        <div className="flex items-start gap-3">
                          <RadioGroupItem
                            value={submission.id}
                            id={`submission-${submission.id}`}
                            className="mt-1"
                          />
                          <label
                            htmlFor={`submission-${submission.id}`}
                            className="flex-1 cursor-pointer"
                          >
                            <div className="flex items-center justify-between mb-2">
                              <div className="flex items-center gap-2">
                                <span className="font-semibold">
                                  {submission.model_name}
                                </span>
                                {submission.is_active && (
                                  <Badge className="bg-success">
                                    <CheckCircle2 className="h-3 w-3 mr-1" />
                                    Active
                                  </Badge>
                                )}
                              </div>
                            </div>
                            <p className="text-sm text-muted-foreground mb-1 truncate">
                              {submission.api_endpoint}
                            </p>
                            <div className="text-xs text-muted-foreground">
                              Submitted:{" "}
                              {new Date(submission.created_at).toLocaleDateString()}
                            </div>
                          </label>
                        </div>
                      </div>
                    ))}
                  </div>
                </RadioGroup>
              )}
            </CardContent>
          </Card>
        </div>
      </div>
    </div>
  );
};

export default Submit;
