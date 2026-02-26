import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { ArrowLeft, BookOpen, Code, FileText } from "lucide-react";
import { useEffect, useState } from "react";
import { useParams, Link } from "react-router-dom";
import { fetchProblem, type Problem } from "@/lib/api";
import ReactMarkdown from "react-markdown";
import remarkMath from "remark-math";
import rehypeKatex from "rehype-katex";

const ProblemDetail = () => {
  const { id } = useParams<{ id: string }>();
  const [problem, setProblem] = useState<Problem | null>(null);
  const [loading, setLoading] = useState(true);
  const [showSolution, setShowSolution] = useState(false);

  useEffect(() => {
    if (id) {
      loadProblem(id);
    }
  }, [id]);

  const loadProblem = async (problemId: string) => {
    try {
      const data = await fetchProblem(problemId);
      setProblem(data);
    } catch (err) {
      console.error("Failed to fetch problem:", err);
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return (
      <div className="min-h-screen bg-background flex items-center justify-center">
        <p className="text-muted-foreground">Loading problem...</p>
      </div>
    );
  }

  if (!problem) {
    return (
      <div className="min-h-screen bg-background flex items-center justify-center">
        <div className="text-center">
          <p className="text-muted-foreground mb-4">Problem not found</p>
          <Link to="/problems">
            <Button variant="outline">Back to Problems</Button>
          </Link>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-background">
      <div className="container mx-auto px-4 py-8 max-w-4xl">
        <Link to="/problems" className="inline-flex items-center gap-2 text-muted-foreground hover:text-foreground mb-6">
          <ArrowLeft className="h-4 w-4" />
          Back to Problems
        </Link>

        {/* Header */}
        <div className="mb-8">
          <h1 className="text-3xl font-bold mb-3">{problem.title || "Untitled Problem"}</h1>
          <div className="flex gap-2 flex-wrap">
            {problem.source && <Badge variant="outline">{problem.source}</Badge>}
            {problem.competition && <Badge variant="outline">{problem.competition}</Badge>}
            {problem.difficulty && <Badge>{problem.difficulty}</Badge>}
            {problem.problem_number && (
              <Badge variant="secondary">Problem #{problem.problem_number}</Badge>
            )}
          </div>
        </div>

        {/* Problem Statement */}
        <Card className="mb-6 shadow-elevation-medium">
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <BookOpen className="h-5 w-5 text-primary" />
              Problem Statement
            </CardTitle>
          </CardHeader>
          <CardContent>
            <div className="prose prose-sm max-w-none dark:prose-invert bg-muted/30 rounded-lg p-4">
              {problem.problem_latex ? (
                <ReactMarkdown remarkPlugins={[remarkMath]} rehypePlugins={[rehypeKatex]}>
                  {problem.problem_latex}
                </ReactMarkdown>
              ) : (
                "No problem text available."
              )}
            </div>
          </CardContent>
        </Card>

        {/* Solution */}
        {problem.solution_latex && (
          <Card className="mb-6 shadow-elevation-medium">
            <CardHeader>
              <div className="flex items-center justify-between">
                <CardTitle className="flex items-center gap-2">
                  <FileText className="h-5 w-5 text-secondary" />
                  Solution
                </CardTitle>
                <Button
                  variant="outline"
                  size="sm"
                  onClick={() => setShowSolution(!showSolution)}
                >
                  {showSolution ? "Hide" : "Show"} Solution
                </Button>
              </div>
            </CardHeader>
            {showSolution && (
              <CardContent>
                <div className="prose prose-sm max-w-none dark:prose-invert bg-muted/30 rounded-lg p-4">
                  <ReactMarkdown remarkPlugins={[remarkMath]} rehypePlugins={[rehypeKatex]}>
                    {problem.solution_latex}
                  </ReactMarkdown>
                </div>
              </CardContent>
            )}
          </Card>
        )}

        {/* Lean Code */}
        {problem.lean_code && (
          <Card className="mb-6 shadow-elevation-medium">
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <Code className="h-5 w-5 text-accent" />
                Lean 4 Formalization
              </CardTitle>
            </CardHeader>
            <CardContent>
              <pre className="text-sm bg-muted/50 rounded-lg p-4 overflow-x-auto">
                <code>{problem.lean_code}</code>
              </pre>
            </CardContent>
          </Card>
        )}

        {/* Metadata */}
        <Card className="shadow-elevation-medium">
          <CardHeader>
            <CardTitle className="text-sm font-medium text-muted-foreground">Metadata</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="grid grid-cols-2 gap-4 text-sm">
              {problem.source_url && (
                <div>
                  <span className="text-muted-foreground">Source: </span>
                  <a
                    href={problem.source_url}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="text-primary hover:underline"
                  >
                    View Original
                  </a>
                </div>
              )}
              {problem.published_date && (
                <div>
                  <span className="text-muted-foreground">Published: </span>
                  <span>{problem.published_date}</span>
                </div>
              )}
              <div>
                <span className="text-muted-foreground">Scraped: </span>
                <span>{new Date(problem.scraped_at).toLocaleDateString()}</span>
              </div>
              {problem.answer && (
                <div>
                  <span className="text-muted-foreground">Answer: </span>
                  <span className="font-mono">{problem.answer}</span>
                </div>
              )}
            </div>
          </CardContent>
        </Card>
      </div>
    </div>
  );
};

export default ProblemDetail;
