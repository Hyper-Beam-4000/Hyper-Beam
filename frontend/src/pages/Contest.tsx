import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Clock, Calendar, Award, TrendingUp, Calculator, Target, ListChecks, CheckCircle, Layers, BookOpen, Code2, GitCompareArrows } from "lucide-react";
import { Link } from "react-router-dom";
import { useEffect, useState } from "react";
import { fetchContests, type Contest as ContestType } from "@/lib/api";

interface TimeRemaining {
  days: number;
  hours: number;
  minutes: number;
  seconds: number;
}

function computeTimeRemaining(endDate: string | null): TimeRemaining {
  if (!endDate) return { days: 0, hours: 0, minutes: 0, seconds: 0 };
  const diff = new Date(endDate).getTime() - Date.now();
  if (diff <= 0) return { days: 0, hours: 0, minutes: 0, seconds: 0 };
  return {
    days: Math.floor(diff / (1000 * 60 * 60 * 24)),
    hours: Math.floor((diff / (1000 * 60 * 60)) % 24),
    minutes: Math.floor((diff / (1000 * 60)) % 60),
    seconds: Math.floor((diff / 1000) % 60),
  };
}

const ContestPage = () => {
  const [contest, setContest] = useState<ContestType | null>(null);
  const [timeRemaining, setTimeRemaining] = useState<TimeRemaining>({
    days: 0, hours: 0, minutes: 0, seconds: 0,
  });
  const [usingFallback, setUsingFallback] = useState(false);

  useEffect(() => {
    loadContest();
  }, []);

  useEffect(() => {
    const endDate = contest?.end_date ?? null;
    const timer = setInterval(() => {
      setTimeRemaining(computeTimeRemaining(endDate));
    }, 1000);
    // Set initial value immediately
    setTimeRemaining(computeTimeRemaining(endDate));
    return () => clearInterval(timer);
  }, [contest?.end_date]);

  const loadContest = async () => {
    try {
      const data = await fetchContests(true);
      if (data.contests.length > 0) {
        setContest(data.contests[0]);
        return;
      }
      // If no active contest, get the most recent one
      const allData = await fetchContests();
      if (allData.contests.length > 0) {
        setContest(allData.contests[0]);
      }
    } catch {
      // API not available — use fallback
      setUsingFallback(true);
    }
  };

  const evaluationMetrics = [
    {
      name: "Answer Correctness",
      weight: "22%",
      icon: Target,
      description: "Binary symbolic verification of the final answer using SymPy equivalence checking",
    },
    {
      name: "Rubric Score",
      weight: "17%",
      icon: ListChecks,
      description: "0–7 ProofBench-style rubric across answer accuracy, reasoning steps, logic, and rigor",
    },
    {
      name: "Embedding Similarity",
      weight: "17%",
      icon: TrendingUp,
      description: "Semantic cosine similarity between predicted and reference proofs via sentence-transformers",
    },
    {
      name: "Semantic Structure",
      weight: "12%",
      icon: Layers,
      description: "Structural overlap of mathematical objects, quantifiers, and logical connectives between proofs",
    },
    {
      name: "Lean Compilation",
      weight: "12%",
      icon: CheckCircle,
      description: "Formal verification — whether the generated Lean 4 proof compiles and is sorry-free",
    },
    {
      name: "Reasoning Alignment",
      weight: "8%",
      icon: GitCompareArrows,
      description: "Step-by-step alignment of mathematical reasoning with an order-inversion penalty",
    },
    {
      name: "Lean Comparison",
      weight: "6%",
      icon: Code2,
      description: "Structural similarity of Lean 4 tactic sequences, imports, and theorem statement shape",
    },
    {
      name: "Proof Technique Match",
      weight: "3%",
      icon: Award,
      description: "Overlap of high-level proof strategies (induction, contradiction, construction, etc.)",
    },
    {
      name: "Concept Coverage",
      weight: "3%",
      icon: BookOpen,
      description: "Breadth of mathematical concepts covered relative to the reference solution",
    },
  ];

  const contestName = contest?.name || "Hyper Beam Math Challenge";
  const startDate = contest?.start_date
    ? new Date(contest.start_date).toLocaleDateString("en-US", { month: "long", day: "numeric", year: "numeric" })
    : "TBD";
  const endDate = contest?.end_date
    ? new Date(contest.end_date).toLocaleDateString("en-US", { month: "long", day: "numeric", year: "numeric" })
    : "TBD";

  return (
    <div className="min-h-screen bg-gradient-to-br from-background via-background to-muted">
      <div className="container mx-auto px-4 py-8">
        {/* Hero Section */}
        <div className="mb-12 text-center">
          <Badge className="mb-4 bg-gradient-accent text-white">
            {contest?.is_active ? "Active Contest" : "Contest"}
          </Badge>
          <h1 className="text-5xl font-bold mb-4 bg-gradient-to-r from-primary via-secondary to-accent bg-clip-text text-transparent">
            {contestName}
          </h1>
          <p className="text-xl text-muted-foreground max-w-3xl mx-auto">
            {contest?.description ||
              "A holistic benchmark for evaluating Large Language Models on mathematical reasoning — 774 problems across USAMO, AMC 12, and AIME (2017–2025), continuously updated with fresh problems."}
          </p>
        </div>

        {/* Countdown Timer */}
        <Card className="mb-8 shadow-elevation-high border-2 border-primary/20">
          <CardHeader className="text-center">
            <CardTitle className="flex items-center justify-center gap-2 text-2xl">
              <Clock className="h-6 w-6 text-primary" />
              Contest Ends In
            </CardTitle>
          </CardHeader>
          <CardContent>
            <div className="grid grid-cols-4 gap-4 max-w-2xl mx-auto">
              {[
                { label: "Days", value: timeRemaining.days },
                { label: "Hours", value: timeRemaining.hours },
                { label: "Minutes", value: timeRemaining.minutes },
                { label: "Seconds", value: timeRemaining.seconds },
              ].map((item) => (
                <div key={item.label} className="text-center">
                  <div className="bg-gradient-hero rounded-lg p-4 mb-2">
                    <span className="text-4xl font-bold text-white">
                      {String(item.value).padStart(2, "0")}
                    </span>
                  </div>
                  <span className="text-sm text-muted-foreground">{item.label}</span>
                </div>
              ))}
            </div>
          </CardContent>
        </Card>

        {/* Contest Details Grid */}
        <div className="grid md:grid-cols-2 gap-6 mb-8">
          <Card className="shadow-elevation-medium hover:shadow-elevation-high transition-all">
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <Calendar className="h-5 w-5 text-primary" />
                Contest Period
              </CardTitle>
            </CardHeader>
            <CardContent className="space-y-2">
              <div className="flex justify-between">
                <span className="text-muted-foreground">Start Date:</span>
                <span className="font-semibold">{startDate}</span>
              </div>
              <div className="flex justify-between">
                <span className="text-muted-foreground">End Date:</span>
                <span className="font-semibold">{endDate}</span>
              </div>
            </CardContent>
          </Card>

          <Card className="shadow-elevation-medium hover:shadow-elevation-high transition-all">
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <Award className="h-5 w-5 text-accent" />
                Submission Rules
              </CardTitle>
            </CardHeader>
            <CardContent className="space-y-2">
              <div className="flex justify-between">
                <span className="text-muted-foreground">Max Submissions:</span>
                <span className="font-semibold">Unlimited</span>
              </div>
              <div className="flex justify-between">
                <span className="text-muted-foreground">Active Submissions:</span>
                <span className="font-semibold">1 per participant</span>
              </div>
              <div className="flex justify-between">
                <span className="text-muted-foreground">Evaluation:</span>
                <span className="font-semibold">Private Test Set</span>
              </div>
            </CardContent>
          </Card>
        </div>

        {/* Evaluation Metrics */}
        <Card className="mb-8 shadow-elevation-medium">
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <Calculator className="h-5 w-5 text-secondary" />
              Evaluation Metrics
            </CardTitle>
            <CardDescription>
              Models are evaluated across multiple mathematical reasoning dimensions
            </CardDescription>
          </CardHeader>
          <CardContent>
            <div className="grid sm:grid-cols-2 gap-6">
              {evaluationMetrics.map((metric) => (
                <div
                  key={metric.name}
                  className="p-5 rounded-lg bg-muted/50 border border-border hover:border-primary/50 transition-colors"
                >
                  <div className="flex items-center gap-3 mb-3">
                    <div className="p-2 rounded-md bg-primary/10">
                      <metric.icon className="h-5 w-5 text-primary" />
                    </div>
                    <div>
                      <h4 className="font-semibold">{metric.name}</h4>
                      <span className="text-sm text-secondary font-medium">
                        Weight: {metric.weight}
                      </span>
                    </div>
                  </div>
                  <p className="text-sm text-muted-foreground">{metric.description}</p>
                </div>
              ))}
            </div>
          </CardContent>
        </Card>

        {/* Problem Sources */}
        <Card className="mb-8 shadow-elevation-medium">
          <CardHeader>
            <CardTitle>Problem Sources</CardTitle>
            <CardDescription>
              774 problems from three AMC-series competitions (2017–2025)
            </CardDescription>
          </CardHeader>
          <CardContent>
            <div className="flex flex-wrap gap-3 mb-4">
              {[
                { label: "USAMO 2017–2025",   count: "54 problems",  detail: "6 per year" },
                { label: "AMC 12A 2017–2025",  count: "225 problems", detail: "25 per year" },
                { label: "AMC 12B 2017–2025",  count: "225 problems", detail: "25 per year" },
                { label: "AIME I 2017–2025",   count: "135 problems", detail: "15 per year" },
                { label: "AIME II 2017–2025",  count: "135 problems", detail: "15 per year" },
              ].map((src) => (
                <div key={src.label} className="flex flex-col items-start px-4 py-2 rounded-md border border-border bg-muted/40">
                  <span className="text-sm font-semibold">{src.label}</span>
                  <span className="text-xs text-muted-foreground">{src.count} · {src.detail}</span>
                </div>
              ))}
            </div>
            <div className="grid sm:grid-cols-2 gap-3 text-sm text-muted-foreground">
              <div className="p-3 rounded-md bg-muted/30 border border-border">
                <span className="font-medium text-foreground">Difficulty tiers</span><br />
                USAMO (olympiad) → AIME (proof-style computation) → AMC 12 (multiple-choice), spanning a wide range of difficulty.
              </div>
              <div className="p-3 rounded-md bg-muted/30 border border-border">
                <span className="font-medium text-foreground">Training-data eras</span><br />
                Pre-GPT (2017), Early GPT (2018), Likely in training data (2019–2023), Post-cutoff held-out (2024–2025). Anti-contamination filtering uses each model's submitted training cutoff date.
              </div>
            </div>
          </CardContent>
        </Card>

        {/* CTA Buttons */}
        <div className="flex flex-col sm:flex-row gap-4 justify-center">
          <Link to="/submit">
            <Button
              size="lg"
              className="bg-gradient-hero hover:opacity-90 transition-opacity text-white"
            >
              Submit Your Model
            </Button>
          </Link>
          <Link to="/leaderboard">
            <Button size="lg" variant="outline">
              View Leaderboard
            </Button>
          </Link>
          <Link to="/problems">
            <Button size="lg" variant="outline">
              Browse Problems
            </Button>
          </Link>
        </div>
      </div>
    </div>
  );
};

export default ContestPage;
