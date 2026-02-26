import { createContext, useContext, useEffect, useState, ReactNode } from "react";
import { User, Session } from "@supabase/supabase-js";
import { supabase } from "@/integrations/supabase/client";
import { setAuthToken } from "@/lib/api";

interface AuthContextType {
  user: any | null;
  session: Session | null;
  loading: boolean;
  logout: () => void;
  setAuthFromToken: (token: string | null) => void;
}

const AuthContext = createContext<AuthContextType>({
  user: null,
  session: null,
  loading: true,
  logout: () => {},
  setAuthFromToken: () => {},
});

export const useAuth = () => {
  const context = useContext(AuthContext);
  if (!context) {
    throw new Error("useAuth must be used within AuthProvider");
  }
  return context;
};

export const AuthProvider = ({ children }: { children: ReactNode }) => {
  const [user, setUser] = useState<User | null>(null);
  const [session, setSession] = useState<Session | null>(null);
  const [loading, setLoading] = useState(true);

  const decodeToken = (token: string | null) => {
    if (!token) return null;
    try {
      const payload = JSON.parse(atob(token.split(".")[1]));
      return { id: payload.sub || "token-user", email: payload.email || "user@example.com" };
    } catch {
      return null;
    }
  };

  const setAuthFromToken = (token: string | null) => {
    setAuthToken(token);
    const decoded = decodeToken(token);
    setUser(decoded as any);
    setSession(null);
    setLoading(false);
  };

  const logout = () => {
    setAuthToken(null);
    setUser(null);
    setSession(null);
  };

  useEffect(() => {
    // If Supabase is not configured, treat auth token as optional demo
    if (!supabase) {
      setAuthFromToken(localStorage.getItem("auth_token"));
      return;
    }

    // Set up auth state listener
    const { data: { subscription } } = supabase.auth.onAuthStateChange(
      (_event, session) => {
        setSession(session);
        setUser(session?.user ?? null);
        setLoading(false);
      }
    );

    // Check for existing session
    supabase.auth.getSession().then(({ data: { session } }) => {
      setSession(session);
      setUser(session?.user ?? null);
      setLoading(false);
    });

    return () => subscription.unsubscribe();
  }, []);

  return (
    <AuthContext.Provider value={{ user, session, loading, logout, setAuthFromToken }}>
      {children}
    </AuthContext.Provider>
  );
};
