import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { BookOpen, Filter } from "lucide-react";
import { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import ReactMarkdown from "react-markdown";
import remarkMath from "remark-math";
import rehypeKatex from "rehype-katex";
import { fetchProblems, type Problem } from "@/lib/api";

const DIFFICULTY_OPTIONS = ["AMC", "AIME", "USAMO", "IMO", "Putnam"];

const difficultyColor: Record<string, string> = {
  AMC: "bg-green-500/20 text-green-700 border-green-500/30",
  AIME: "bg-blue-500/20 text-blue-700 border-blue-500/30",
  USAMO: "bg-orange-500/20 text-orange-700 border-orange-500/30",
  IMO: "bg-red-500/20 text-red-700 border-red-500/30",
  Putnam: "bg-purple-500/20 text-purple-700 border-purple-500/30",
};

const Problems = () => {
  const [problems, setProblems] = useState<Problem[]>([]);
  const [loading, setLoading] = useState(true);
  const [competition, setCompetition] = useState<string>("");
  const [difficulty, setDifficulty] = useState<string>("");

  useEffect(() => {
    loadProblems();
  }, [competition, difficulty]);

  const loadProblems = async () => {
    setLoading(true);
    try {
      const params: Record<string, string> = {};
      if (competition) params.competition = competition;
      if (difficulty) params.difficulty = difficulty;
      const data = await fetchProblems(params);
      setProblems(data.problems);
    } catch (err) {
      console.error("Failed to fetch problems:", err);
      setProblems([]);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="min-h-screen bg-background">
      <div className="container mx-auto px-4 py-8">
        <div className="mb-8">
          <div className="flex items-center gap-3 mb-2">
            <BookOpen className="h-8 w-8 text-primary" />
            <h1 className="text-4xl font-bold">Problem Browser</h1>
          </div>
          <p className="text-muted-foreground text-lg">
            Browse competition math problems from our database
          </p>
        </div>

        {/* Filters */}
        <div className="flex gap-4 mb-8 flex-wrap">
          <div className="flex items-center gap-2">
            <Filter className="h-4 w-4 text-muted-foreground" />
            <span className="text-sm text-muted-foreground">Filters:</span>
          </div>
          <Select value={competition} onValueChange={(v) => setCompetition(v === "all" ? "" : v)}>
            <SelectTrigger className="w-[200px]">
              <SelectValue placeholder="Competition" />
            </SelectTrigger>
            <SelectContent>
              <SelectItem value="all">All Competitions</SelectItem>
              <SelectItem value="AMC">AMC</SelectItem>
              <SelectItem value="AIME">AIME</SelectItem>
              <SelectItem value="USAMO">USAMO</SelectItem>
              <SelectItem value="IMO">IMO</SelectItem>
              <SelectItem value="Putnam">Putnam</SelectItem>
            </SelectContent>
          </Select>
          <Select value={difficulty} onValueChange={(v) => setDifficulty(v === "all" ? "" : v)}>
            <SelectTrigger className="w-[200px]">
              <SelectValue placeholder="Difficulty" />
            </SelectTrigger>
            <SelectContent>
              <SelectItem value="all">All Difficulties</SelectItem>
              {DIFFICULTY_OPTIONS.map((d) => (
                <SelectItem key={d} value={d}>{d}</SelectItem>
              ))}
            </SelectContent>
          </Select>
        </div>

        {/* Problem Grid */}
        {loading ? (
          <div className="text-center py-12">
            <p className="text-muted-foreground">Loading problems...</p>
          </div>
        ) : problems.length === 0 ? (
          <div className="text-center py-12">
            <BookOpen className="h-16 w-16 mx-auto mb-4 text-muted-foreground" />
            <p className="text-muted-foreground">No problems found</p>
            <p className="text-sm text-muted-foreground">Try adjusting your filters</p>
          </div>
        ) : (
          <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
            {problems.map((problem) => (
              <Link key={problem.id} to={`/problems/${problem.id}`}>
                <Card className="shadow-elevation-medium hover:shadow-elevation-high transition-all cursor-pointer h-full">
                  <CardHeader className="pb-3">
                    <div className="flex items-start justify-between gap-2">
                      <CardTitle className="text-lg leading-tight line-clamp-2">
                        {problem.title || "Untitled Problem"}
                      </CardTitle>
                    </div>
                    <div className="flex gap-2 flex-wrap">
                      {problem.competition && (
                        <Badge variant="outline">{problem.competition}</Badge>
                      )}
                      {problem.difficulty && (
                        <Badge className={difficultyColor[problem.difficulty] || ""}>
                          {problem.difficulty}
                        </Badge>
                      )}
                    </div>
                  </CardHeader>
                  <CardContent>
                    <div className="text-sm text-muted-foreground line-clamp-4 prose prose-sm max-w-none dark:prose-invert">
                      {problem.problem_latex ? (
                        <ReactMarkdown
                          remarkPlugins={[remarkMath]}
                          rehypePlugins={[rehypeKatex]}
                        >
                          {problem.problem_latex.length > 400
                            ? problem.problem_latex.substring(0, 400) + " ..."
                            : problem.problem_latex}
                        </ReactMarkdown>
                      ) : (
                        "No problem text available"
                      )}
                    </div>
                    {problem.problem_number && (
                      <p className="text-xs text-muted-foreground mt-3">
                        Problem #{problem.problem_number}
                      </p>
                    )}
                  </CardContent>
                </Card>
              </Link>
            ))}
          </div>
        )}
      </div>
    </div>
  );
};

export default Problems;
