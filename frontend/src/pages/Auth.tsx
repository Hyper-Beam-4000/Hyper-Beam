import { useState } from "react";
import { useNavigate } from "react-router-dom";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { supabase } from "@/integrations/supabase/client";
import { useToast } from "@/hooks/use-toast";
import { Trophy, Loader2 } from "lucide-react";
import {
  isLocalAuthMode,
  findLocalAccount,
  addLocalAccount,
  setLocalUser,
  createLocalUserId,
} from "@/lib/localAuth";

const Auth = () => {
  const navigate = useNavigate();
  const { toast } = useToast();
  const [loading, setLoading] = useState(false);

  const handleSignUp = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setLoading(true);

    const formData = new FormData(e.currentTarget);
    const email = formData.get("signup-email") as string;
    const password = formData.get("signup-password") as string;
    const teamName = formData.get("team-name") as string;

    if (isLocalAuthMode()) {
      const existing = findLocalAccount(email);
      if (existing) {
        setLoading(false);
        toast({
          title: "Sign up failed",
          description: "An account with this email already exists. Sign in instead.",
          variant: "destructive",
        });
        return;
      }
      const id = createLocalUserId();
      addLocalAccount({ id, email, team_name: teamName });
      setLocalUser({
        id,
        email,
        user_metadata: { team_name: teamName },
      });
      setLoading(false);
      toast({
        title: "Account created!",
        description: "You can now submit to contests (local dev).",
      });
      navigate("/");
      return;
    }

    const { error } = await supabase.auth.signUp({
      email,
      password,
      options: {
        emailRedirectTo: `${window.location.origin}/`,
        data: {
          team_name: teamName,
        },
      },
    });

    setLoading(false);

    if (error) {
      toast({
        title: "Sign up failed",
        description: error.message,
        variant: "destructive",
      });
    } else {
      const { data: { user } } = await supabase.auth.getUser();
      if (user) {
        await supabase
          .from("profiles")
          .update({ team_name: teamName })
          .eq("id", user.id);
      }
      toast({
        title: "Account created!",
        description: "You can now submit to contests.",
      });
      navigate("/");
    }
  };

  const handleSignIn = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setLoading(true);

    const formData = new FormData(e.currentTarget);
    const email = formData.get("signin-email") as string;
    const password = formData.get("signin-password") as string;

    if (isLocalAuthMode()) {
      const account = findLocalAccount(email);
      if (!account) {
        setLoading(false);
        toast({
          title: "Sign in failed",
          description: "No account with this email. Create an account first.",
          variant: "destructive",
        });
        return;
      }
      if (!password || password.length < 6) {
        setLoading(false);
        toast({
          title: "Sign in failed",
          description: "Please enter your password (min 6 characters).",
          variant: "destructive",
        });
        return;
      }
      setLocalUser({
        id: account.id,
        email: account.email,
        user_metadata: { team_name: account.team_name },
      });
      setLoading(false);
      toast({
        title: "Welcome back!",
        description: "You've successfully signed in (local dev).",
      });
      navigate("/");
      return;
    }

    const { error } = await supabase.auth.signInWithPassword({
      email,
      password,
    });

    setLoading(false);

    if (error) {
      toast({
        title: "Sign in failed",
        description: error.message,
        variant: "destructive",
      });
    } else {
      toast({
        title: "Welcome back!",
        description: "You've successfully signed in.",
      });
      navigate("/");
    }
  };

  return (
    <div className="min-h-screen bg-gradient-to-br from-background via-background to-muted flex items-center justify-center p-4">
      <Card className="w-full max-w-md shadow-elevation-high">
        <CardHeader className="text-center">
          <div className="flex justify-center mb-4">
            <div className="h-12 w-12 rounded-lg bg-gradient-hero flex items-center justify-center">
              <Trophy className="h-7 w-7 text-primary-foreground" />
            </div>
          </div>
          <CardTitle className="text-2xl">Hyper Beam</CardTitle>
          <CardDescription>
            Sign in to submit your models to the benchmark
          </CardDescription>
        </CardHeader>
        <CardContent>
          <Tabs defaultValue="signin">
            <TabsList className="grid w-full grid-cols-2">
              <TabsTrigger value="signin">Sign In</TabsTrigger>
              <TabsTrigger value="signup">Sign Up</TabsTrigger>
            </TabsList>

            <TabsContent value="signin">
              <form onSubmit={handleSignIn} className="space-y-4">
                <div className="space-y-2">
                  <Label htmlFor="signin-email">Email</Label>
                  <Input
                    id="signin-email"
                    name="signin-email"
                    type="email"
                    placeholder="you@example.com"
                    required
                  />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="signin-password">Password</Label>
                  <Input
                    id="signin-password"
                    name="signin-password"
                    type="password"
                    required
                  />
                </div>
                <Button
                  type="submit"
                  className="w-full bg-gradient-hero text-white"
                  disabled={loading}
                >
                  {loading ? (
                    <>
                      <Loader2 className="mr-2 h-4 w-4 animate-spin" />
                      Signing in...
                    </>
                  ) : (
                    "Sign In"
                  )}
                </Button>
              </form>
            </TabsContent>

            <TabsContent value="signup">
              <form onSubmit={handleSignUp} className="space-y-4">
                <div className="space-y-2">
                  <Label htmlFor="team-name">Team Name</Label>
                  <Input
                    id="team-name"
                    name="team-name"
                    type="text"
                    placeholder="Your team name"
                    required
                  />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="signup-email">Email</Label>
                  <Input
                    id="signup-email"
                    name="signup-email"
                    type="email"
                    placeholder="you@example.com"
                    required
                  />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="signup-password">Password</Label>
                  <Input
                    id="signup-password"
                    name="signup-password"
                    type="password"
                    minLength={6}
                    required
                  />
                </div>
                <Button
                  type="submit"
                  className="w-full bg-gradient-hero text-white"
                  disabled={loading}
                >
                  {loading ? (
                    <>
                      <Loader2 className="mr-2 h-4 w-4 animate-spin" />
                      Creating account...
                    </>
                  ) : (
                    "Create Account"
                  )}
                </Button>
              </form>
            </TabsContent>
          </Tabs>
        </CardContent>
      </Card>
    </div>
  );
};

export default Auth;
