import { useState } from "react";
import { useNavigate } from "react-router-dom";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Dialog, DialogContent, DialogDescription, DialogHeader, DialogTitle } from "@/components/ui/dialog";
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { Archive as ArchiveIcon, Calendar, Users, TrendingUp, Trophy, Target, Brain, Wrench, Sparkles } from "lucide-react";

interface LeaderboardEntry {
  rank: number;
  team: string;
  model: string;
  overallScore: number;
  problemSolving: number;
  stepReasoning: number;
  selfRepair: number;
  answerPrediction: number;
}

interface ContestDetails {
  description: string;
  tasks: string[];
  evaluationCriteria: string[];
  prizes: { place: string; prize: string }[];
}

interface Contest {
  id: number;
  name: string;
  period: string;
  participants: number;
  winner: string;
  winningScore: number;
  status: string;
  leaderboard: LeaderboardEntry[];
  details: ContestDetails;
}

const pastContests: Contest[] = [
  {
    id: 1,
    name: "Q3 2025 LLM Benchmark Challenge",
    period: "August 1 - September 30, 2025",
    participants: 248,
    winner: "OpenAI Research",
    winningScore: 94.2,
    status: "Completed",
    leaderboard: [
      { rank: 1, team: "OpenAI Research", model: "GPT-5-Turbo", overallScore: 94.2, problemSolving: 95.1, stepReasoning: 93.8, selfRepair: 94.0, answerPrediction: 93.9 },
      { rank: 2, team: "Anthropic", model: "Claude-4", overallScore: 93.1, problemSolving: 92.8, stepReasoning: 94.2, selfRepair: 92.5, answerPrediction: 92.9 },
      { rank: 3, team: "Google DeepMind", model: "Gemini Ultra 2", overallScore: 92.4, problemSolving: 91.9, stepReasoning: 93.1, selfRepair: 92.0, answerPrediction: 92.6 },
      { rank: 4, team: "Meta AI", model: "LLaMA-4 70B", overallScore: 91.8, problemSolving: 92.3, stepReasoning: 91.2, selfRepair: 91.5, answerPrediction: 92.2 },
      { rank: 5, team: "xAI", model: "Grok-3", overallScore: 90.5, problemSolving: 90.1, stepReasoning: 91.0, selfRepair: 90.2, answerPrediction: 90.7 },
      { rank: 6, team: "Mistral AI", model: "Mixtral-Next", overallScore: 89.7, problemSolving: 89.2, stepReasoning: 90.1, selfRepair: 89.8, answerPrediction: 89.7 },
      { rank: 7, team: "Cohere", model: "Command-R Ultra", overallScore: 88.9, problemSolving: 88.5, stepReasoning: 89.2, selfRepair: 88.7, answerPrediction: 89.2 },
      { rank: 8, team: "AI21 Labs", model: "Jamba 2.0", overallScore: 87.6, problemSolving: 87.1, stepReasoning: 88.0, selfRepair: 87.5, answerPrediction: 87.8 },
    ],
    details: {
      description: "The Q3 2025 LLM Benchmark Challenge focused on evaluating large language models across complex reasoning tasks, mathematical problem-solving, and code generation capabilities.",
      tasks: [
        "Multi-step mathematical reasoning (500 problems)",
        "Code generation and debugging (200 challenges)",
        "Logical deduction puzzles (300 scenarios)",
        "Scientific reasoning questions (250 problems)",
      ],
      evaluationCriteria: [
        "Problem Solving: Accuracy on novel problem types",
        "Step Reasoning: Quality of intermediate reasoning steps",
        "Self-Repair: Ability to correct errors when given feedback",
        "Answer Prediction: Confidence calibration and final answer accuracy",
      ],
      prizes: [
        { place: "1st Place", prize: "$50,000 + Research Grant" },
        { place: "2nd Place", prize: "$25,000" },
        { place: "3rd Place", prize: "$10,000" },
      ],
    },
  },
  {
    id: 2,
    name: "Q2 2025 Safety & Alignment Contest",
    period: "May 1 - June 30, 2025",
    participants: 189,
    winner: "Anthropic",
    winningScore: 92.8,
    status: "Completed",
    leaderboard: [
      { rank: 1, team: "Anthropic", model: "Claude-4 Safe", overallScore: 92.8, problemSolving: 91.5, stepReasoning: 93.2, selfRepair: 93.8, answerPrediction: 92.7 },
      { rank: 2, team: "OpenAI Research", model: "GPT-5-Safe", overallScore: 91.9, problemSolving: 92.1, stepReasoning: 91.5, selfRepair: 92.0, answerPrediction: 92.0 },
      { rank: 3, team: "Google DeepMind", model: "Gemini Safe", overallScore: 90.7, problemSolving: 90.2, stepReasoning: 91.1, selfRepair: 90.5, answerPrediction: 91.0 },
      { rank: 4, team: "Redwood Research", model: "SafeAgent-2", overallScore: 89.4, problemSolving: 88.9, stepReasoning: 89.8, selfRepair: 89.5, answerPrediction: 89.4 },
      { rank: 5, team: "Conjecture", model: "Aligned-LM", overallScore: 88.2, problemSolving: 87.8, stepReasoning: 88.5, selfRepair: 88.1, answerPrediction: 88.4 },
      { rank: 6, team: "EleutherAI", model: "GPT-NeoX Safe", overallScore: 86.9, problemSolving: 86.5, stepReasoning: 87.2, selfRepair: 86.8, answerPrediction: 87.1 },
    ],
    details: {
      description: "This contest evaluated AI models on safety, alignment, and responsible behavior. Models were tested on their ability to refuse harmful requests while remaining helpful.",
      tasks: [
        "Harmful request detection (1000 scenarios)",
        "Truthfulness under pressure (400 adversarial prompts)",
        "Value alignment tests (350 ethical dilemmas)",
        "Robustness to jailbreak attempts (500 tests)",
      ],
      evaluationCriteria: [
        "Problem Solving: Helpfulness on legitimate requests",
        "Step Reasoning: Transparency in decision-making",
        "Self-Repair: Recovery from adversarial manipulation",
        "Answer Prediction: Appropriate refusal calibration",
      ],
      prizes: [
        { place: "1st Place", prize: "$40,000 + Safety Research Fellowship" },
        { place: "2nd Place", prize: "$20,000" },
        { place: "3rd Place", prize: "$8,000" },
      ],
    },
  },
  {
    id: 3,
    name: "Q1 2025 Multimodal Evaluation",
    period: "February 1 - March 31, 2025",
    participants: 156,
    winner: "Google DeepMind",
    winningScore: 91.5,
    status: "Completed",
    leaderboard: [
      { rank: 1, team: "Google DeepMind", model: "Gemini Ultra Vision", overallScore: 91.5, problemSolving: 92.0, stepReasoning: 91.2, selfRepair: 91.0, answerPrediction: 91.8 },
      { rank: 2, team: "OpenAI Research", model: "GPT-4V Plus", overallScore: 90.8, problemSolving: 91.2, stepReasoning: 90.5, selfRepair: 90.3, answerPrediction: 91.2 },
      { rank: 3, team: "Anthropic", model: "Claude-3.5 Vision", overallScore: 89.6, problemSolving: 89.1, stepReasoning: 90.0, selfRepair: 89.5, answerPrediction: 89.8 },
      { rank: 4, team: "Meta AI", model: "ImageBind-LM", overallScore: 88.2, problemSolving: 87.8, stepReasoning: 88.5, selfRepair: 88.0, answerPrediction: 88.5 },
      { rank: 5, team: "Microsoft Research", model: "Kosmos-3", overallScore: 86.9, problemSolving: 86.5, stepReasoning: 87.1, selfRepair: 86.8, answerPrediction: 87.2 },
    ],
    details: {
      description: "The Q1 2025 Multimodal Evaluation tested models on their ability to understand and reason across text, images, and video content.",
      tasks: [
        "Visual question answering (800 image-text pairs)",
        "Chart and diagram interpretation (300 complex visuals)",
        "Video understanding (150 clips with questions)",
        "Document OCR and analysis (400 documents)",
      ],
      evaluationCriteria: [
        "Problem Solving: Accuracy on visual reasoning tasks",
        "Step Reasoning: Quality of visual-to-text explanations",
        "Self-Repair: Error correction on visual misinterpretations",
        "Answer Prediction: Confidence on ambiguous visual inputs",
      ],
      prizes: [
        { place: "1st Place", prize: "$35,000 + GPU Credits" },
        { place: "2nd Place", prize: "$18,000" },
        { place: "3rd Place", prize: "$7,000" },
      ],
    },
  },
  {
    id: 4,
    name: "Q4 2024 General Performance Benchmark",
    period: "November 1 - December 31, 2024",
    participants: 134,
    winner: "Meta AI",
    winningScore: 89.3,
    status: "Completed",
    leaderboard: [
      { rank: 1, team: "Meta AI", model: "LLaMA-3 70B", overallScore: 89.3, problemSolving: 89.8, stepReasoning: 88.9, selfRepair: 89.0, answerPrediction: 89.5 },
      { rank: 2, team: "OpenAI Research", model: "GPT-4-Turbo", overallScore: 88.7, problemSolving: 89.1, stepReasoning: 88.2, selfRepair: 88.5, answerPrediction: 89.0 },
      { rank: 3, team: "Anthropic", model: "Claude-3 Opus", overallScore: 87.9, problemSolving: 87.5, stepReasoning: 88.3, selfRepair: 87.8, answerPrediction: 88.0 },
      { rank: 4, team: "Google DeepMind", model: "Gemini Pro 1.5", overallScore: 87.2, problemSolving: 86.8, stepReasoning: 87.5, selfRepair: 87.0, answerPrediction: 87.5 },
      { rank: 5, team: "Mistral AI", model: "Mixtral 8x22B", overallScore: 85.6, problemSolving: 85.2, stepReasoning: 85.9, selfRepair: 85.5, answerPrediction: 85.8 },
      { rank: 6, team: "Cohere", model: "Command-R+", overallScore: 84.1, problemSolving: 83.7, stepReasoning: 84.4, selfRepair: 84.0, answerPrediction: 84.3 },
      { rank: 7, team: "AI21 Labs", model: "Jamba 1.5", overallScore: 82.8, problemSolving: 82.4, stepReasoning: 83.0, selfRepair: 82.7, answerPrediction: 83.1 },
    ],
    details: {
      description: "The foundational benchmark that established our evaluation framework. This contest tested general language understanding, reasoning, and generation capabilities.",
      tasks: [
        "Reading comprehension (600 passages)",
        "Common sense reasoning (450 scenarios)",
        "World knowledge questions (500 questions)",
        "Text generation quality (300 prompts)",
      ],
      evaluationCriteria: [
        "Problem Solving: General task completion accuracy",
        "Step Reasoning: Logical consistency in responses",
        "Self-Repair: Improvement after feedback",
        "Answer Prediction: Overall response quality",
      ],
      prizes: [
        { place: "1st Place", prize: "$30,000" },
        { place: "2nd Place", prize: "$15,000" },
        { place: "3rd Place", prize: "$5,000" },
      ],
    },
  },
];

const Archive = () => {
  const navigate = useNavigate();
  const [selectedContest, setSelectedContest] = useState<Contest | null>(null);
  const [dialogType, setDialogType] = useState<"leaderboard" | "details" | null>(null);

  const openDialog = (contest: Contest, type: "leaderboard" | "details") => {
    setSelectedContest(contest);
    setDialogType(type);
  };

  const closeDialog = () => {
    setSelectedContest(null);
    setDialogType(null);
  };

  const handleSubmitToArchive = (contestId: number) => {
    navigate(`/submit?archive=${contestId}`);
  };

  return (
    <div className="min-h-screen bg-background">
      <div className="container mx-auto px-4 py-8">
        <div className="mb-8">
          <div className="flex items-center gap-3 mb-2">
            <ArchiveIcon className="h-8 w-8 text-primary" />
            <h1 className="text-4xl font-bold">Contest Archive</h1>
          </div>
          <p className="text-muted-foreground text-lg">
            Browse past contests and submit to archived challenges
          </p>
        </div>

        <div className="mb-6 p-4 rounded-lg bg-muted/50 border border-border">
          <div className="flex items-start gap-3">
            <TrendingUp className="h-5 w-5 text-primary flex-shrink-0 mt-0.5" />
            <div>
              <h3 className="font-semibold mb-1">Non-Competitive Submissions</h3>
              <p className="text-sm text-muted-foreground">
                You can submit models to archived contests for evaluation and comparison, but these submissions 
                will not appear on the official leaderboard. This is useful for benchmarking against historical results.
              </p>
            </div>
          </div>
        </div>

        <div className="grid gap-6">
          {pastContests.map((contest) => (
            <Card key={contest.id} className="shadow-elevation-medium hover:shadow-elevation-high transition-all">
              <CardHeader>
                <div className="flex items-start justify-between">
                  <div>
                    <CardTitle className="text-2xl mb-2">{contest.name}</CardTitle>
                    <CardDescription className="flex items-center gap-2 text-base">
                      <Calendar className="h-4 w-4" />
                      {contest.period}
                    </CardDescription>
                  </div>
                  <Badge variant="secondary" className="text-sm">
                    {contest.status}
                  </Badge>
                </div>
              </CardHeader>
              <CardContent>
                <div className="grid md:grid-cols-3 gap-6 mb-6">
                  <div className="space-y-1">
                    <div className="flex items-center gap-2 text-muted-foreground text-sm">
                      <Users className="h-4 w-4" />
                      <span>Participants</span>
                    </div>
                    <p className="text-2xl font-bold">{contest.participants}</p>
                  </div>

                  <div className="space-y-1">
                    <p className="text-muted-foreground text-sm">Winner</p>
                    <p className="text-xl font-semibold">{contest.winner}</p>
                  </div>

                  <div className="space-y-1">
                    <p className="text-muted-foreground text-sm">Winning Score</p>
                    <p className="text-2xl font-bold text-success">{contest.winningScore}</p>
                  </div>
                </div>

                <div className="flex gap-3">
                  <Button variant="default" onClick={() => handleSubmitToArchive(contest.id)}>
                    Submit to Archive
                  </Button>
                  <Button variant="outline" onClick={() => openDialog(contest, "leaderboard")}>
                    View Leaderboard
                  </Button>
                  <Button variant="ghost" onClick={() => openDialog(contest, "details")}>
                    View Details
                  </Button>
                </div>
              </CardContent>
            </Card>
          ))}
        </div>
      </div>

      {/* Leaderboard Dialog */}
      <Dialog open={dialogType === "leaderboard"} onOpenChange={closeDialog}>
        <DialogContent className="max-w-4xl max-h-[80vh] overflow-y-auto">
          <DialogHeader>
            <DialogTitle className="flex items-center gap-2 text-xl">
              <Trophy className="h-5 w-5 text-primary" />
              {selectedContest?.name} - Leaderboard
            </DialogTitle>
            <DialogDescription>
              Final standings from {selectedContest?.period}
            </DialogDescription>
          </DialogHeader>
          
          <div className="mt-4">
            <Table>
              <TableHeader>
                <TableRow>
                  <TableHead className="w-16">Rank</TableHead>
                  <TableHead>Team</TableHead>
                  <TableHead>Model</TableHead>
                  <TableHead className="text-right">Overall</TableHead>
                  <TableHead className="text-right">
                    <div className="flex items-center justify-end gap-1">
                      <Target className="h-3 w-3" />
                      Problem
                    </div>
                  </TableHead>
                  <TableHead className="text-right">
                    <div className="flex items-center justify-end gap-1">
                      <Brain className="h-3 w-3" />
                      Reasoning
                    </div>
                  </TableHead>
                  <TableHead className="text-right">
                    <div className="flex items-center justify-end gap-1">
                      <Wrench className="h-3 w-3" />
                      Self-Repair
                    </div>
                  </TableHead>
                  <TableHead className="text-right">
                    <div className="flex items-center justify-end gap-1">
                      <Sparkles className="h-3 w-3" />
                      Prediction
                    </div>
                  </TableHead>
                </TableRow>
              </TableHeader>
              <TableBody>
                {selectedContest?.leaderboard.map((entry) => (
                  <TableRow key={entry.rank} className={entry.rank <= 3 ? "bg-muted/30" : ""}>
                    <TableCell className="font-medium">
                      {entry.rank === 1 && <span className="text-yellow-500">🥇</span>}
                      {entry.rank === 2 && <span className="text-gray-400">🥈</span>}
                      {entry.rank === 3 && <span className="text-amber-600">🥉</span>}
                      {entry.rank > 3 && entry.rank}
                    </TableCell>
                    <TableCell className="font-medium">{entry.team}</TableCell>
                    <TableCell className="text-muted-foreground">{entry.model}</TableCell>
                    <TableCell className="text-right font-bold text-primary">{entry.overallScore}</TableCell>
                    <TableCell className="text-right">{entry.problemSolving}</TableCell>
                    <TableCell className="text-right">{entry.stepReasoning}</TableCell>
                    <TableCell className="text-right">{entry.selfRepair}</TableCell>
                    <TableCell className="text-right">{entry.answerPrediction}</TableCell>
                  </TableRow>
                ))}
              </TableBody>
            </Table>
          </div>
        </DialogContent>
      </Dialog>

      {/* Details Dialog */}
      <Dialog open={dialogType === "details"} onOpenChange={closeDialog}>
        <DialogContent className="max-w-2xl max-h-[80vh] overflow-y-auto">
          <DialogHeader>
            <DialogTitle className="text-xl">{selectedContest?.name}</DialogTitle>
            <DialogDescription>
              {selectedContest?.period} • {selectedContest?.participants} participants
            </DialogDescription>
          </DialogHeader>
          
          <div className="mt-4 space-y-6">
            <div>
              <h3 className="font-semibold mb-2">Description</h3>
              <p className="text-muted-foreground">{selectedContest?.details.description}</p>
            </div>

            <div>
              <h3 className="font-semibold mb-2">Tasks</h3>
              <ul className="list-disc list-inside space-y-1 text-muted-foreground">
                {selectedContest?.details.tasks.map((task, index) => (
                  <li key={index}>{task}</li>
                ))}
              </ul>
            </div>

            <div>
              <h3 className="font-semibold mb-2">Evaluation Criteria</h3>
              <ul className="space-y-2">
                {selectedContest?.details.evaluationCriteria.map((criteria, index) => (
                  <li key={index} className="text-sm text-muted-foreground bg-muted/50 p-2 rounded">
                    {criteria}
                  </li>
                ))}
              </ul>
            </div>

          </div>
        </DialogContent>
      </Dialog>
    </div>
  );
};

export default Archive;
