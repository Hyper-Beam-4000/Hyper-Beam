import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Link } from "react-router-dom";
import { Calculator, RefreshCw, Target, ListChecks, ArrowRight, Zap } from "lucide-react";

const Index = () => {
  const features = [
    {
      icon: Calculator,
      title: "Problem Solving",
      description: "Direct mathematical problem solving across multiple domains"
    },
    {
      icon: RefreshCw,
      title: "Self Repair",
      description: "Identify and fix errors in incorrect solutions"
    },
    {
      icon: Target,
      title: "Answer Prediction",
      description: "Predict final numerical answers accurately"
    },
    {
      icon: ListChecks,
      title: "Step-by-Step Reasoning",
      description: "Quality of intermediate reasoning steps"
    },
  ];

  return (
    <div className="min-h-screen bg-gradient-to-br from-background via-background to-muted">
      {/* Hero Section */}
      <div className="container mx-auto px-4 pt-20 pb-16">
        <div className="text-center max-w-4xl mx-auto">
          <Badge className="mb-6 bg-gradient-accent text-white px-4 py-1.5">
            <Zap className="h-3 w-3 mr-1 inline" />
            Live Benchmark
          </Badge>
          <h1 className="text-6xl md:text-7xl font-bold mb-6 bg-gradient-to-r from-primary via-secondary to-accent bg-clip-text text-transparent leading-tight">
            Hyper Beam
          </h1>
          <p className="text-2xl text-muted-foreground mb-4">
            Holistic & Contamination-Free Evaluation of LLMs for Mathematics
          </p>
          <p className="text-lg text-muted-foreground mb-10 max-w-2xl mx-auto">
            Continuously updated with fresh problems from competitive mathematics platforms. 
            Evaluate your models across problem solving, self-repair, and reasoning capabilities.
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Link to="/contest">
              <Button size="lg" className="bg-gradient-hero hover:opacity-90 transition-opacity text-white px-8">
                View Active Contest
                <ArrowRight className="ml-2 h-4 w-4" />
              </Button>
            </Link>
            <Link to="/leaderboard">
              <Button size="lg" variant="outline" className="px-8">
                Leaderboard
              </Button>
            </Link>
          </div>
        </div>
      </div>

      {/* Features Grid */}
      <div className="container mx-auto px-4 py-16">
        <div className="text-center mb-12">
          <h2 className="text-3xl font-bold mb-4">Evaluation Dimensions</h2>
          <p className="text-muted-foreground max-w-2xl mx-auto">
            Models are evaluated across four key mathematical reasoning capabilities, 
            inspired by LiveCodeBench's holistic approach to code evaluation.
          </p>
        </div>
        <div className="grid sm:grid-cols-2 lg:grid-cols-4 gap-6 max-w-5xl mx-auto">
          {features.map((feature) => (
            <Card key={feature.title} className="shadow-elevation-medium hover:shadow-elevation-high transition-all border-border hover:border-primary/50">
              <CardContent className="pt-6 text-center">
                <div className="p-3 rounded-lg bg-primary/10 w-fit mx-auto mb-4">
                  <feature.icon className="h-6 w-6 text-primary" />
                </div>
                <h3 className="font-semibold mb-2">{feature.title}</h3>
                <p className="text-sm text-muted-foreground">{feature.description}</p>
              </CardContent>
            </Card>
          ))}
        </div>
      </div>

      {/* How It Works */}
      <div className="container mx-auto px-4 py-16">
        <div className="max-w-4xl mx-auto">
          <div className="text-center mb-12">
            <h2 className="text-3xl font-bold mb-4">How It Works</h2>
            <p className="text-muted-foreground">
              A contamination-free benchmark that evolves over time
            </p>
          </div>
          <div className="grid md:grid-cols-3 gap-8">
            {[
              { step: "1", title: "Fresh Problems", desc: "Problems collected from AMC, AIME, Math Olympiad, and university competitions" },
              { step: "2", title: "Submit via API", desc: "Connect your model via API endpoint for automated evaluation" },
              { step: "3", title: "Fair Ranking", desc: "Scores hidden during contest to prevent gaming the system" },
            ].map((item) => (
              <div key={item.step} className="text-center">
                <div className="w-12 h-12 rounded-full bg-gradient-hero text-white font-bold text-xl flex items-center justify-center mx-auto mb-4">
                  {item.step}
                </div>
                <h3 className="font-semibold mb-2">{item.title}</h3>
                <p className="text-sm text-muted-foreground">{item.desc}</p>
              </div>
            ))}
          </div>
        </div>
      </div>

      {/* CTA Section */}
      <div className="container mx-auto px-4 py-16">
        <Card className="bg-gradient-hero border-0 shadow-elevation-high">
          <CardContent className="py-12 text-center">
            <h2 className="text-3xl font-bold text-white mb-4">Ready to Benchmark Your Model?</h2>
            <p className="text-white/80 mb-8 max-w-xl mx-auto">
              Join the leaderboard and see how your LLM performs on mathematical reasoning tasks.
            </p>
            <Link to="/submit">
              <Button size="lg" variant="secondary" className="px-8">
                Submit Your Model
                <ArrowRight className="ml-2 h-4 w-4" />
              </Button>
            </Link>
          </CardContent>
        </Card>
      </div>
    </div>
  );
};

export default Index;