/**
 * Local auth for development on localhost.
 * Set VITE_USE_LOCAL_AUTH=true in .env to sign in and persist auth in localStorage
 * without Supabase. When you deploy to AWS, omit this or set to false to use Supabase.
 */

const LOCAL_AUTH_KEY = "hyperbeam_local_user";
const LOCAL_ACCOUNTS_KEY = "hyperbeam_local_accounts";

export interface LocalUser {
  id: string;
  email: string;
  user_metadata?: { team_name?: string };
}

export interface LocalAccount {
  id: string;
  email: string;
  team_name: string;
}

export function isLocalAuthMode(): boolean {
  return import.meta.env.VITE_USE_LOCAL_AUTH === "true";
}

export function getLocalUser(): LocalUser | null {
  try {
    const raw = localStorage.getItem(LOCAL_AUTH_KEY);
    if (!raw) return null;
    return JSON.parse(raw) as LocalUser;
  } catch {
    return null;
  }
}

export const LOCAL_AUTH_CHANGED_EVENT = "hyperbeam_local_auth_changed";

export function setLocalUser(user: LocalUser): void {
  localStorage.setItem(LOCAL_AUTH_KEY, JSON.stringify(user));
  window.dispatchEvent(new CustomEvent(LOCAL_AUTH_CHANGED_EVENT));
}

export function clearLocalUser(): void {
  localStorage.removeItem(LOCAL_AUTH_KEY);
  window.dispatchEvent(new CustomEvent(LOCAL_AUTH_CHANGED_EVENT));
}

export function getLocalAccounts(): LocalAccount[] {
  try {
    const raw = localStorage.getItem(LOCAL_ACCOUNTS_KEY);
    if (!raw) return [];
    return JSON.parse(raw) as LocalAccount[];
  } catch {
    return [];
  }
}

function setLocalAccounts(accounts: LocalAccount[]): void {
  localStorage.setItem(LOCAL_ACCOUNTS_KEY, JSON.stringify(accounts));
}

export function findLocalAccount(email: string): LocalAccount | undefined {
  const accounts = getLocalAccounts();
  return accounts.find((a) => a.email.toLowerCase() === email.toLowerCase());
}

export function addLocalAccount(account: LocalAccount): void {
  const accounts = getLocalAccounts();
  if (accounts.some((a) => a.email.toLowerCase() === account.email.toLowerCase())) {
    return;
  }
  accounts.push(account);
  setLocalAccounts(accounts);
}

export function createLocalUserId(): string {
  return `local-${crypto.randomUUID()}`;
}
