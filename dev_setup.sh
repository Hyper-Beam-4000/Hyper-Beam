#!/usr/bin/env bash
# One-shot developer setup for Hyper Beam (local dev).
# Installs deps, prepares env files, and optionally bootstraps AWS infra.

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

need() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "[-] Missing dependency: $1" >&2
    exit 1
  fi
}

copy_env_if_missing() {
  local example="$1"
  local target="$2"
  if [[ -f "$target" ]]; then
    echo "[=] $target exists"
  else
    cp "$example" "$target"
    echo "[+] Created $target from $example (fill in secrets/keys)."
  fi
}

echo "[*] Checking prerequisites..."
need python3
need pip3
need npm

echo "[*] Ensuring env files exist..."
copy_env_if_missing "$ROOT_DIR/backend/.env.example" "$ROOT_DIR/backend/.env"
copy_env_if_missing "$ROOT_DIR/scraper/.env.example" "$ROOT_DIR/scraper/.env"
copy_env_if_missing "$ROOT_DIR/frontend/.env.example" "$ROOT_DIR/frontend/.env"

echo "[*] Installing python dependencies..."
pip3 install -r "$ROOT_DIR/requirements.txt"

echo "[*] Installing frontend dependencies..."
(
  cd "$ROOT_DIR/frontend"
  npm install
)

if [[ "${BOOTSTRAP_INFRA:-0}" == "1" ]]; then
  echo "[*] Bootstrapping DynamoDB table and SQS queues (requires AWS creds)..."
  (
    cd "$ROOT_DIR/backend"
    python3 scripts/bootstrap_infra.py
  )
else
  echo "[!] Skipping AWS infra bootstrap (set BOOTSTRAP_INFRA=1 to run)."
fi

cat <<'DONE'

Setup complete.

Run services:
  Backend:  cd backend && uvicorn backend.main:app --reload --host 0.0.0.0 --port 8000
  Frontend: cd frontend && npm run dev
  Scraper:  cd scraper && SCRAPER_PERSIST_TO_DDB=true python scrape_problem.py --url <AOPS_URL> --out scraped_problems --lean

Remember to fill backend/.env and scraper/.env with AWS keys/region (and Supabase, if used) before calling Bedrock or DynamoDB.
DONE
