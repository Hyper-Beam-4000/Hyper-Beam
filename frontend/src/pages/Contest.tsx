import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Clock, Calendar, Award, TrendingUp, Calculator, RefreshCw, Target, ListChecks } from "lucide-react";
import { Link } from "react-router-dom";
import { useEffect, useState } from "react";

const Contest = () => {
  const [timeRemaining, setTimeRemaining] = useState({
    days: 14,
    hours: 3,
    minutes: 42,
    seconds: 18
  });

  useEffect(() => {
    const timer = setInterval(() => {
      setTimeRemaining(prev => {
        if (prev.seconds > 0) {
          return { ...prev, seconds: prev.seconds - 1 };
        } else if (prev.minutes > 0) {
          return { ...prev, minutes: prev.minutes - 1, seconds: 59 };
        } else if (prev.hours > 0) {
          return { ...prev, hours: prev.hours - 1, minutes: 59, seconds: 59 };
        } else if (prev.days > 0) {
          return { ...prev, days: prev.days - 1, hours: 23, minutes: 59, seconds: 59 };
        }
        return prev;
      });
    }, 1000);

    return () => clearInterval(timer);
  }, []);

  const evaluationMetrics = [
    { 
      name: "Problem Solving", 
      weight: "30%", 
      icon: Calculator,
      description: "Direct mathematical problem solving across algebra, calculus, geometry, and more"
    },
    { 
      name: "Self Repair", 
      weight: "25%", 
      icon: RefreshCw,
      description: "Ability to identify and fix errors in incorrect mathematical solutions"
    },
    { 
      name: "Answer Prediction", 
      weight: "20%", 
      icon: Target,
      description: "Predicting final numerical answers from problem statements"
    },
    { 
      name: "Step-by-Step Reasoning", 
      weight: "25%", 
      icon: ListChecks,
      description: "Quality and correctness of intermediate reasoning steps"
    },
  ];

  return (
    <div className="min-h-screen bg-gradient-to-br from-background via-background to-muted">
      <div className="container mx-auto px-4 py-8">
        {/* Hero Section */}
        <div className="mb-12 text-center">
          <Badge className="mb-4 bg-gradient-accent text-white">Active Contest</Badge>
          <h1 className="text-5xl font-bold mb-4 bg-gradient-to-r from-primary via-secondary to-accent bg-clip-text text-transparent">
            Hyper Beam Math Challenge
          </h1>
          <p className="text-xl text-muted-foreground max-w-3xl mx-auto">
            A holistic benchmark for evaluating Large Language Models on mathematical reasoning—continuously updated with fresh problems.
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
                { label: "Seconds", value: timeRemaining.seconds }
              ].map((item) => (
                <div key={item.label} className="text-center">
                  <div className="bg-gradient-hero rounded-lg p-4 mb-2">
                    <span className="text-4xl font-bold text-white">{String(item.value).padStart(2, '0')}</span>
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
                <span className="font-semibold">November 1, 2025</span>
              </div>
              <div className="flex justify-between">
                <span className="text-muted-foreground">End Date:</span>
                <span className="font-semibold">December 15, 2025</span>
              </div>
              <div className="flex justify-between">
                <span className="text-muted-foreground">Duration:</span>
                <span className="font-semibold">45 Days</span>
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
              <TrendingUp className="h-5 w-5 text-secondary" />
              Evaluation Metrics
            </CardTitle>
            <CardDescription>
              Models are evaluated across four key mathematical reasoning dimensions
            </CardDescription>
          </CardHeader>
          <CardContent>
            <div className="grid sm:grid-cols-2 gap-6">
              {evaluationMetrics.map((metric) => (
                <div key={metric.name} className="p-5 rounded-lg bg-muted/50 border border-border hover:border-primary/50 transition-colors">
                  <div className="flex items-center gap-3 mb-3">
                    <div className="p-2 rounded-md bg-primary/10">
                      <metric.icon className="h-5 w-5 text-primary" />
                    </div>
                    <div>
                      <h4 className="font-semibold">{metric.name}</h4>
                      <span className="text-sm text-secondary font-medium">Weight: {metric.weight}</span>
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
              Fresh problems collected from competitive mathematics platforms
            </CardDescription>
          </CardHeader>
          <CardContent>
            <div className="flex flex-wrap gap-3">
              {["AMC", "AIME", "Math Olympiad", "Putnam", "IMO", "University Competitions"].map((source) => (
                <Badge key={source} variant="outline" className="px-4 py-2 text-sm">
                  {source}
                </Badge>
              ))}
            </div>
            <p className="text-sm text-muted-foreground mt-4">
              Problems are continuously collected from periodic contests to ensure contamination-free evaluation.
            </p>
          </CardContent>
        </Card>

        {/* CTA Buttons */}
        <div className="flex flex-col sm:flex-row gap-4 justify-center">
          <Link to="/submit">
            <Button size="lg" className="bg-gradient-hero hover:opacity-90 transition-opacity text-white">
              Submit Your Model
            </Button>
          </Link>
          <Link to="/leaderboard">
            <Button size="lg" variant="outline">
              View Leaderboard
            </Button>
          </Link>
        </div>
      </div>
    </div>
  );
};

export default Contest;