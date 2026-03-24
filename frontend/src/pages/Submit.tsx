import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Textarea } from "@/components/ui/textarea";
import { Badge } from "@/components/ui/badge";
import { Progress } from "@/components/ui/progress";
import { Upload, Link as LinkIcon, AlertCircle, CheckCircle2, Play, FileUp, Square, RotateCcw, Trash2 } from "lucide-react";
import { useState, useEffect } from "react";
import { useToast } from "@/hooks/use-toast";
import {
  createSubmission,
  listSubmissions,
  triggerEvaluation,
  cancelEvaluation,
  deleteSubmission,
  fetchProgress,
  uploadResults,
  type Submission,
} from "@/lib/api";

const statusBadge: Record<string, { label: string; className: string }> = {
  pending:   { label: "Pending",   className: "bg-gray-500/20 text-gray-700" },
  queued:    { label: "Queued",    className: "bg-yellow-500/20 text-yellow-700" },
  running:   { label: "Running",   className: "bg-blue-500/20 text-blue-700" },
  completed: { label: "Completed", className: "bg-green-500/20 text-green-700" },
  failed:    { label: "Failed",    className: "bg-red-500/20 text-red-700" },
  cancelled: { label: "Cancelled", className: "bg-orange-500/20 text-orange-700" },
};

const Submit = () => {
  const { toast } = useToast();
  const [loading, setLoading] = useState(false);
  const [submissions, setSubmissions] = useState<Submission[]>([]);
  const [evaluating, setEvaluating] = useState<string | null>(null);
  const [cancelling, setCancelling] = useState<string | null>(null);
  const [deleting, setDeleting] = useState<string | null>(null);
  const [uploading, setUploading] = useState<string | null>(null);
  const [progress, setProgress] = useState<Record<string, { scored: number; total: number; pct: number }>>({});

  // Form state
  const [modelName, setModelName] = useState("");
  const [apiEndpoint, setApiEndpoint] = useState("");
  const [trainingCutoff, setTrainingCutoff] = useState("");
  const [description, setDescription] = useState("");

  useEffect(() => {
    loadSubmissions();
  }, []);

  // Poll every 4s while any submission is active; also fetch progress
  useEffect(() => {
    const active = submissions.filter((s) =>
      s.evaluation_status === "running" || s.evaluation_status === "queued"
    );
    if (active.length === 0) return;

    const tick = async () => {
      await loadSubmissions();
      const results = await Promise.all(
        active.map((s) => fetchProgress(s.id).then((p) => ({ id: s.id, p })))
      );
      setProgress((prev) => {
        const next = { ...prev };
        results.forEach(({ id, p }) => { next[id] = p; });
        return next;
      });
    };

    const id = setInterval(tick, 4000);
    return () => clearInterval(id);
  }, [submissions]);

  const loadSubmissions = async () => {
    try {
      const data = await listSubmissions();
      setSubmissions(data.submissions);
    } catch (err) {
      console.error("Failed to load submissions:", err);
    }
  };

  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setLoading(true);
    try {
      await createSubmission({
        model_name: modelName,
        api_endpoint: apiEndpoint,
        training_cutoff_date: trainingCutoff || undefined,
        description: description || undefined,
      });
      toast({ title: "Submission created", description: "Click Evaluate to start scoring." });
      setModelName("");
      setApiEndpoint("");
      setTrainingCutoff("");
      setDescription("");
      await loadSubmissions();
    } catch (err: any) {
      toast({ title: "Submission failed", description: err.message, variant: "destructive" });
    } finally {
      setLoading(false);
    }
  };

  const handleEvaluate = async (submissionId: string) => {
    setEvaluating(submissionId);
    try {
      await triggerEvaluation(submissionId);
      toast({ title: "Evaluation queued", description: "Scoring is running in the background." });
      await loadSubmissions();
    } catch (err: any) {
      toast({ title: "Evaluation failed", description: err.message, variant: "destructive" });
    } finally {
      setEvaluating(null);
    }
  };

  const handleCancel = async (submissionId: string) => {
    setCancelling(submissionId);
    try {
      await cancelEvaluation(submissionId);
      toast({ title: "Evaluation cancelled" });
      await loadSubmissions();
    } catch (err: any) {
      toast({ title: "Cancel failed", description: err.message, variant: "destructive" });
    } finally {
      setCancelling(null);
    }
  };

  const handleDelete = async (submissionId: string) => {
    if (!window.confirm("Delete this submission? This cannot be undone.")) return;
    setDeleting(submissionId);
    try {
      await deleteSubmission(submissionId);
      toast({ title: "Submission deleted" });
      setSubmissions((prev) => prev.filter((s) => s.id !== submissionId));
    } catch (err: any) {
      toast({ title: "Delete failed", description: err.message, variant: "destructive" });
    } finally {
      setDeleting(null);
    }
  };

  const handleUpload = async (submissionId: string, file: File) => {
    setUploading(submissionId);
    try {
      const result = await uploadResults(submissionId, file);
      toast({
        title: "Upload complete",
        description: `Processed ${result.processed} results.`,
      });
      await loadSubmissions();
    } catch (err: any) {
      toast({ title: "Upload failed", description: err.message, variant: "destructive" });
    } finally {
      setUploading(null);
    }
  };

  return (
    <div className="min-h-screen bg-background">
      <div className="container mx-auto px-4 py-8">
        <div className="mb-8">
          <div className="flex items-center gap-3 mb-2">
            <Upload className="h-8 w-8 text-primary" />
            <h1 className="text-4xl font-bold">Submit Model</h1>
          </div>
          <p className="text-muted-foreground text-lg">
            Submit your model API endpoint for evaluation against USAMO problems
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
                  <Input
                    id="model-name"
                    placeholder="e.g., GPT-4o-mini"
                    value={modelName}
                    onChange={(e) => setModelName(e.target.value)}
                    required
                  />
                </div>

                <div className="space-y-2">
                  <Label htmlFor="api-endpoint">API Endpoint URL</Label>
                  <div className="relative">
                    <LinkIcon className="absolute left-3 top-3 h-4 w-4 text-muted-foreground" />
                    <Input
                      id="api-endpoint"
                      type="url"
                      placeholder="https://api.example.com/v1/chat/completions"
                      className="pl-10"
                      value={apiEndpoint}
                      onChange={(e) => setApiEndpoint(e.target.value)}
                      required
                    />
                  </div>
                  <p className="text-xs text-muted-foreground">
                    Must accept POST with OpenAI-compatible JSON (messages array) or{" "}
                    <code className="bg-muted px-1 rounded">{"{ prompt }"}</code>. Returns response within 120s.
                  </p>
                </div>

                <div className="space-y-2">
                  <Label htmlFor="training-cutoff">Training Cutoff Date (optional)</Label>
                  <Input
                    id="training-cutoff"
                    type="date"
                    value={trainingCutoff}
                    onChange={(e) => setTrainingCutoff(e.target.value)}
                  />
                  <p className="text-xs text-muted-foreground">
                    Problems from before this date are excluded to prevent data contamination
                  </p>
                </div>

                <div className="space-y-2">
                  <Label htmlFor="description">Description (optional)</Label>
                  <Textarea
                    id="description"
                    placeholder="Briefly describe your model or approach..."
                    rows={3}
                    value={description}
                    onChange={(e) => setDescription(e.target.value)}
                  />
                </div>

                <div className="bg-muted/50 rounded-lg p-4 border border-border">
                  <div className="flex gap-2">
                    <AlertCircle className="h-5 w-5 text-primary flex-shrink-0 mt-0.5" />
                    <ul className="text-sm text-muted-foreground space-y-1">
                      <li>POST requests with JSON — OpenAI-compatible or simple prompt format</li>
                      <li>120 second response timeout per problem</li>
                      <li>Alternatively, upload a pre-computed results JSON file</li>
                    </ul>
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

          {/* Submissions List */}
          <Card className="shadow-elevation-medium">
            <CardHeader>
              <CardTitle>Your Submissions</CardTitle>
              <CardDescription>
                Trigger evaluation or upload pre-computed results
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
                <div className="space-y-4">
                  {submissions.map((sub) => {
                    const status = statusBadge[sub.evaluation_status || "pending"] || statusBadge.pending;
                    return (
                      <div
                        key={sub.id}
                        className="p-4 rounded-lg border border-border bg-card"
                      >
                        <div className="flex items-center justify-between mb-1">
                          <span className="font-semibold">{sub.model_name}</span>
                          <div className="flex items-center gap-2">
                            {sub.evaluation_status === "completed" && (
                              <CheckCircle2 className="h-4 w-4 text-green-600" />
                            )}
                            <Badge className={status.className}>{status.label}</Badge>
                            <Button
                              size="sm"
                              variant="ghost"
                              className="h-6 w-6 p-0 text-muted-foreground hover:text-destructive"
                              disabled={deleting === sub.id}
                              onClick={() => handleDelete(sub.id)}
                              title="Delete submission"
                            >
                              <Trash2 className="h-3.5 w-3.5" />
                            </Button>
                          </div>
                        </div>
                        <p className="text-sm text-muted-foreground mb-1 truncate">
                          {sub.api_endpoint}
                        </p>
                        {sub.overall_score != null && (
                          <p className="text-sm font-medium text-primary mb-2">
                            Score: {(sub.overall_score * 100).toFixed(1)}%
                          </p>
                        )}
                        <p className="text-xs text-muted-foreground mb-3">
                          {sub.created_at ? new Date(sub.created_at).toLocaleString() : ""}
                        </p>

                        {/* Progress bar — shown while running or queued */}
                        {(sub.evaluation_status === "running" || sub.evaluation_status === "queued") && (
                          <div className="mb-3">
                            <div className="flex justify-between text-xs text-muted-foreground mb-1">
                              <span>Evaluating problems…</span>
                              <span>
                                {progress[sub.id]
                                  ? `${progress[sub.id].scored} / ${progress[sub.id].total}`
                                  : "—"}
                              </span>
                            </div>
                            <Progress value={progress[sub.id]?.pct ?? 0} className="h-2" />
                          </div>
                        )}

                        <div className="flex gap-2 flex-wrap">
                          {/* Cancel — shown while running or queued */}
                          {(sub.evaluation_status === "running" || sub.evaluation_status === "queued") && (
                            <Button
                              size="sm"
                              variant="destructive"
                              disabled={cancelling === sub.id}
                              onClick={() => handleCancel(sub.id)}
                            >
                              <Square className="h-3 w-3 mr-1" />
                              {cancelling === sub.id ? "Cancelling..." : "Cancel"}
                            </Button>
                          )}

                          {/* Evaluate / Restart */}
                          {sub.evaluation_status !== "running" && sub.evaluation_status !== "queued" && (
                            <Button
                              size="sm"
                              variant="outline"
                              disabled={evaluating === sub.id}
                              onClick={() => handleEvaluate(sub.id)}
                            >
                              {sub.evaluation_status === "completed" || sub.evaluation_status === "cancelled" || sub.evaluation_status === "failed" ? (
                                <><RotateCcw className="h-3 w-3 mr-1" />{evaluating === sub.id ? "Starting..." : "Restart"}</>
                              ) : (
                                <><Play className="h-3 w-3 mr-1" />{evaluating === sub.id ? "Starting..." : "Evaluate"}</>
                              )}
                            </Button>
                          )}

                          {/* Upload Results */}
                          <Button
                            size="sm"
                            variant="outline"
                            disabled={uploading === sub.id}
                            onClick={() => {
                              const input = document.createElement("input");
                              input.type = "file";
                              input.accept = ".json";
                              input.onchange = (ev) => {
                                const file = (ev.target as HTMLInputElement).files?.[0];
                                if (file) handleUpload(sub.id, file);
                              };
                              input.click();
                            }}
                          >
                            <FileUp className="h-3 w-3 mr-1" />
                            {uploading === sub.id ? "Uploading..." : "Upload Results"}
                          </Button>
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
    </div>
  );
};

export default Submit;
