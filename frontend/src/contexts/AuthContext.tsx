import { createContext, useContext, useEffect, useState, ReactNode } from "react";
import { User, Session } from "@supabase/supabase-js";
import { supabase } from "@/integrations/supabase/client";
import {
  isLocalAuthMode,
  getLocalUser,
  clearLocalUser,
  LOCAL_AUTH_CHANGED_EVENT,
} from "@/lib/localAuth";

interface AuthContextType {
  user: User | null;
  session: Session | null;
  loading: boolean;
  signOut: () => Promise<void>;
}

const AuthContext = createContext<AuthContextType>({
  user: null,
  session: null,
  loading: true,
  signOut: async () => {},
});

export const useAuth = () => {
  const context = useContext(AuthContext);
  if (!context) {
    throw new Error("useAuth must be used within AuthProvider");
  }
  return context;
};

/** LocalUser has id, email; cast to User for compatibility with components that use user.id / user.email */
function localUserToUser(local: ReturnType<typeof getLocalUser>): User | null {
  if (!local) return null;
  return {
    id: local.id,
    email: local.email ?? undefined,
    user_metadata: local.user_metadata ?? {},
    app_metadata: {},
    aud: "local",
    created_at: new Date().toISOString(),
  } as User;
}

export const AuthProvider = ({ children }: { children: ReactNode }) => {
  const [user, setUser] = useState<User | null>(null);
  const [session, setSession] = useState<Session | null>(null);
  const [loading, setLoading] = useState(true);
  const localMode = isLocalAuthMode();

  useEffect(() => {
    if (localMode) {
      const applyLocalUser = () => {
        const local = getLocalUser();
        setUser(localUserToUser(local));
        setSession(local ? ({ user: localUserToUser(local) } as Session) : null);
        setLoading(false);
      };
      applyLocalUser();
      const handler = () => applyLocalUser();
      window.addEventListener(LOCAL_AUTH_CHANGED_EVENT, handler);
      return () => window.removeEventListener(LOCAL_AUTH_CHANGED_EVENT, handler);
    }

    const { data: { subscription } } = supabase.auth.onAuthStateChange(
      (_event, session) => {
        setSession(session);
        setUser(session?.user ?? null);
        setLoading(false);
      }
    );

    supabase.auth.getSession().then(({ data: { session } }) => {
      setSession(session);
      setUser(session?.user ?? null);
      setLoading(false);
    });

    return () => subscription.unsubscribe();
  }, [localMode]);

  const signOut = async () => {
    if (localMode) {
      clearLocalUser();
      setUser(null);
      setSession(null);
      return;
    }
    await supabase.auth.signOut();
    setUser(null);
    setSession(null);
  };

  return (
    <AuthContext.Provider value={{ user, session, loading, signOut }}>
      {children}
    </AuthContext.Provider>
  );
};
