import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Textarea } from "@/components/ui/textarea";
import { Badge } from "@/components/ui/badge";
import { Upload, Link as LinkIcon, AlertCircle, CheckCircle2, Archive, Play, FileUp } from "lucide-react";
import { useState, useEffect, useRef } from "react";
import { useSearchParams } from "react-router-dom";
import { useToast } from "@/hooks/use-toast";
import { RadioGroup, RadioGroupItem } from "@/components/ui/radio-group";
import { useAuth } from "@/contexts/AuthContext";
import { triggerEvaluation, uploadResults } from "@/lib/api";

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
  evaluation_status: string | null;
}

const statusBadge: Record<string, { label: string; className: string }> = {
  pending: { label: "Pending", className: "bg-gray-500/20 text-gray-700" },
  queued: { label: "Queued", className: "bg-yellow-500/20 text-yellow-700" },
  running: { label: "Running", className: "bg-blue-500/20 text-blue-700" },
  completed: { label: "Completed", className: "bg-green-500/20 text-green-700" },
  failed: { label: "Failed", className: "bg-red-500/20 text-red-700" },
};

const Submit = () => {
  const { toast } = useToast();
  const { user } = useAuth();
  const [searchParams] = useSearchParams();
  const [loading, setLoading] = useState(false);
  const [submissions, setSubmissions] = useState<Submission[]>([]);
  const [activeSubmission, setActiveSubmission] = useState<string | null>(null);
  const [evaluating, setEvaluating] = useState<string | null>(null);
  const [uploading, setUploading] = useState<string | null>(null);
  const fileInputRef = useRef<HTMLInputElement>(null);

  const archiveContestId = searchParams.get("archive");
  const archiveContest = archiveContestId ? archivedContests[archiveContestId] : null;

  useEffect(() => {
    // Supabase submissions are disabled in this demo
  }, [user]);

  const fetchSubmissions = async () => {};

  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    toast({ title: "Submissions disabled in this demo", description: "Backend Supabase submissions are not configured." , variant: "destructive"});
  };

  const handleSetActive = async (submissionId: string) => {
    toast({ title: "Submissions disabled", description: "Cannot set active submission in demo mode.", variant: "destructive" });
  };

  const handleEvaluate = async (_submissionId: string) => {
    toast({ title: "Evaluations disabled", description: "Cannot trigger evaluation without submissions in demo mode.", variant: "destructive" });
  };

  const handleUpload = async (_submissionId: string, _file: File) => {
    toast({ title: "Uploads disabled", description: "Cannot upload results in demo mode.", variant: "destructive" });
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
                  <Input id="model-name" name="model-name" placeholder="e.g., GPT-Eval-v1.3" required />
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
                  <Label htmlFor="training-cutoff">Training Cutoff Date</Label>
                  <Input
                    id="training-cutoff"
                    name="training-cutoff"
                    type="date"
                    placeholder="YYYY-MM-DD"
                  />
                  <p className="text-xs text-muted-foreground">
                    Problems published before this date will be excluded to prevent data contamination
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
                        <li>- Endpoint must accept POST requests with JSON payload</li>
                        <li>- Must return evaluation results in specified format</li>
                        <li>- Response time should be under 120 seconds per request</li>
                        <li>- Alternatively, upload a results JSON file below</li>
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
                Select active submission, trigger evaluation, or upload results
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
                    {submissions.map((submission) => {
                      const status = statusBadge[submission.evaluation_status || "pending"] || statusBadge.pending;
                      return (
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
                                  <span className="font-semibold">{submission.model_name}</span>
                                  {submission.is_active && (
                                    <Badge className="bg-success">
                                      <CheckCircle2 className="h-3 w-3 mr-1" />
                                      Active
                                    </Badge>
                                  )}
                                  <Badge className={status.className}>{status.label}</Badge>
                                </div>
                              </div>
                              <p className="text-sm text-muted-foreground mb-1 truncate">
                                {submission.api_endpoint}
                              </p>
                              <div className="text-xs text-muted-foreground mb-3">
                                Submitted: {new Date(submission.created_at).toLocaleDateString()}
                              </div>
                            </label>
                          </div>

                          {/* Action buttons */}
                          <div className="flex gap-2 ml-7">
                            <Button
                              size="sm"
                              variant="outline"
                              disabled={evaluating === submission.id || submission.evaluation_status === "running"}
                              onClick={(e) => {
                                e.preventDefault();
                                handleEvaluate(submission.id);
                              }}
                            >
                              <Play className="h-3 w-3 mr-1" />
                              {evaluating === submission.id ? "Starting..." : "Evaluate"}
                            </Button>
                            <Button
                              size="sm"
                              variant="outline"
                              disabled={uploading === submission.id}
                              onClick={(e) => {
                                e.preventDefault();
                                // Open file picker
                                const input = document.createElement("input");
                                input.type = "file";
                                input.accept = ".json";
                                input.onchange = (ev) => {
                                  const file = (ev.target as HTMLInputElement).files?.[0];
                                  if (file) handleUpload(submission.id, file);
                                };
                                input.click();
                              }}
                            >
                              <FileUp className="h-3 w-3 mr-1" />
                              {uploading === submission.id ? "Uploading..." : "Upload Results"}
                            </Button>
                          </div>
                        </div>
                      );
                    })}
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
