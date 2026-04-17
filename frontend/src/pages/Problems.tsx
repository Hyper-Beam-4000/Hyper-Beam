import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { BookOpen, Filter } from "lucide-react";
import { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import ReactMarkdown from "react-markdown";
import remarkMath from "remark-math";
import rehypeKatex from "rehype-katex";
import { fetchProblems, type Problem } from "@/lib/api";

const YEARS = [2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024, 2025];

const COMPETITIONS = [
  { value: "USAMO",   label: "USAMO" },
  { value: "AMC 12A", label: "AMC 12A" },
  { value: "AMC 12B", label: "AMC 12B" },
  { value: "AIME I",  label: "AIME I" },
  { value: "AIME II", label: "AIME II" },
];

const Problems = () => {
  const [problems, setProblems] = useState<Problem[]>([]);
  const [loading, setLoading] = useState(true);
  const [competition, setCompetition] = useState<string>("");
  const [year, setYear] = useState<string>("");

  useEffect(() => {
    loadProblems();
  }, [competition, year]);

  const loadProblems = async () => {
    setLoading(true);
    try {
      const data = await fetchProblems({
        competition: competition || undefined,
        year: year ? Number(year) : undefined,
      });
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
          <Select value={competition || "all"} onValueChange={(v) => setCompetition(v === "all" ? "" : v)}>
            <SelectTrigger className="w-[200px]">
              <SelectValue placeholder="Competition" />
            </SelectTrigger>
            <SelectContent>
              <SelectItem value="all">All Competitions</SelectItem>
              {COMPETITIONS.map((c) => (
                <SelectItem key={c.value} value={c.value}>{c.label}</SelectItem>
              ))}
            </SelectContent>
          </Select>
          <Select value={year || "all"} onValueChange={(v) => setYear(v === "all" ? "" : v)}>
            <SelectTrigger className="w-[160px]">
              <SelectValue placeholder="Year" />
            </SelectTrigger>
            <SelectContent>
              <SelectItem value="all">All Years</SelectItem>
              {YEARS.map((y) => (
                <SelectItem key={y} value={String(y)}>{y}</SelectItem>
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
                    <CardTitle className="text-lg leading-tight line-clamp-2">
                      {problem.title || "Untitled Problem"}
                    </CardTitle>
                    <div className="flex gap-2 flex-wrap">
                      {problem.competition && (
                        <Badge variant="outline">{problem.competition}</Badge>
                      )}
                      {problem.year && (
                        <Badge variant="secondary">{problem.year}</Badge>
                      )}
                      {problem.problem_number && (
                        <Badge variant="secondary">#{problem.problem_number}</Badge>
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
