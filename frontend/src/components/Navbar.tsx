import { Link, useLocation, useNavigate } from "react-router-dom";
import { Button } from "@/components/ui/button";
import { Trophy, BarChart3, Upload, Archive, Menu, LogOut, LogIn } from "lucide-react";
import logo from "@/assets/logo.png";
import { useState } from "react";
import { Sheet, SheetContent, SheetTrigger } from "@/components/ui/sheet";
import { useAuth } from "@/contexts/AuthContext";
import { supabase } from "@/integrations/supabase/client";
import { useToast } from "@/hooks/use-toast";

const Navbar = () => {
  const location = useLocation();
  const navigate = useNavigate();
  const { toast } = useToast();
  const { user } = useAuth();
  const [open, setOpen] = useState(false);

  const isActive = (path: string) => location.pathname === path;

  const handleLogout = async () => {
    await supabase.auth.signOut();
    toast({
      title: "Signed out",
      description: "You've been successfully signed out.",
    });
    navigate("/");
  };

  const NavLinks = ({ mobile = false }) => (
    <>
      <Link to="/">
        <Button 
          variant={isActive("/") ? "secondary" : "ghost"}
          className={mobile ? "w-full justify-start" : ""}
        >
          <Trophy className="h-4 w-4 mr-2" />
          Contest
        </Button>
      </Link>
      <Link to="/leaderboard">
        <Button 
          variant={isActive("/leaderboard") ? "secondary" : "ghost"}
          className={mobile ? "w-full justify-start" : ""}
        >
          <BarChart3 className="h-4 w-4 mr-2" />
          Leaderboard
        </Button>
      </Link>
      <Link to="/dashboard">
        <Button 
          variant={isActive("/dashboard") ? "secondary" : "ghost"}
          className={mobile ? "w-full justify-start" : ""}
        >
          <BarChart3 className="h-4 w-4 mr-2" />
          Dashboard
        </Button>
      </Link>
      <Link to="/submit">
        <Button 
          variant={isActive("/submit") ? "secondary" : "ghost"}
          className={mobile ? "w-full justify-start" : ""}
        >
          <Upload className="h-4 w-4 mr-2" />
          Submit
        </Button>
      </Link>
      <Link to="/archive">
        <Button 
          variant={isActive("/archive") ? "secondary" : "ghost"}
          className={mobile ? "w-full justify-start" : ""}
        >
          <Archive className="h-4 w-4 mr-2" />
          Archive
        </Button>
      </Link>
    </>
  );

  return (
    <nav className="border-b bg-card sticky top-0 z-50">
      <div className="container mx-auto px-4 py-3">
        <div className="flex items-center justify-between">
          <Link to="/" className="flex items-center gap-2">
            <img src={logo} alt="Hyper Beam" className="h-14 w-auto" />
          </Link>

          {/* Desktop Navigation */}
          <div className="hidden md:flex items-center gap-2">
            <NavLinks />
            {user ? (
              <Button variant="ghost" onClick={handleLogout}>
                <LogOut className="h-4 w-4 mr-2" />
                Sign Out
              </Button>
            ) : (
              <Link to="/auth">
                <Button variant="default">
                  <LogIn className="h-4 w-4 mr-2" />
                  Sign In
                </Button>
              </Link>
            )}
          </div>

          {/* Mobile Navigation */}
          <Sheet open={open} onOpenChange={setOpen}>
            <SheetTrigger asChild className="md:hidden">
              <Button variant="ghost" size="icon">
                <Menu className="h-5 w-5" />
              </Button>
            </SheetTrigger>
            <SheetContent>
              <div className="flex flex-col gap-2 mt-8">
                <NavLinks mobile />
                {user ? (
                  <Button variant="ghost" onClick={handleLogout} className="w-full justify-start">
                    <LogOut className="h-4 w-4 mr-2" />
                    Sign Out
                  </Button>
                ) : (
                  <Link to="/auth">
                    <Button variant="default" className="w-full justify-start">
                      <LogIn className="h-4 w-4 mr-2" />
                      Sign In
                    </Button>
                  </Link>
                )}
              </div>
            </SheetContent>
          </Sheet>
        </div>
      </div>
    </nav>
  );
};

export default Navbar;
