"""Backend configuration — reads from environment variables."""

import os
from dotenv import load_dotenv

load_dotenv(os.path.join(os.path.dirname(__file__), ".env"))

SUPABASE_URL: str = os.getenv("SUPABASE_URL", "")
SUPABASE_SERVICE_KEY: str = os.getenv("SUPABASE_SERVICE_KEY", "")

AWS_ACCESS_KEY_ID: str = os.getenv("AWS_ACCESS_KEY_ID", "")
AWS_SECRET_ACCESS_KEY: str = os.getenv("AWS_SECRET_ACCESS_KEY", "")
AWS_REGION: str = os.getenv("AWS_REGION", "us-east-1")
AWS_PROFILE: str = os.getenv("AWS_PROFILE", "")
SAGEMAKER_ENDPOINT_NAME: str = os.getenv("SAGEMAKER_ENDPOINT_NAME", "")
OPENAI_API_KEY: str = os.getenv("OPENAI_API_KEY", "")

API_SECRET_KEY: str = os.getenv("API_SECRET_KEY", "changeme")

# Data & queues
DDB_TABLE: str = os.getenv("DDB_TABLE", "hyperbeam-main")          # legacy single-table fallback
DDB_TABLE_PROBLEM: str = os.getenv("DDB_TABLE_PROBLEM", "hyperbeam-problem")
DDB_TABLE_SCORE: str = os.getenv("DDB_TABLE_SCORE", "hyperbeam-score")
DDB_TABLE_SUBMISSION: str = os.getenv("DDB_TABLE_SUBMISSION", "hyperbeam-submission")
DDB_TABLE_USER: str = os.getenv("DDB_TABLE_USER", "hyperbeam-user")
SQS_SCRAPE_QUEUE: str = os.getenv("SQS_SCRAPE_QUEUE", "hyperbeam-scrape-jobs")
SQS_SCORE_QUEUE: str = os.getenv("SQS_SCORE_QUEUE", "hyperbeam-score-jobs")

CORS_ALLOW_ALL: bool = os.getenv("CORS_ALLOW_ALL", "true").lower() == "true"

if CORS_ALLOW_ALL:
    CORS_ORIGINS: list[str] = ["*"]
else:
    CORS_ORIGINS: list[str] = [
        "http://localhost:5173",
        "http://localhost:3000",
        os.getenv("FRONTEND_URL", ""),
    ]
    # Filter out empty strings
    CORS_ORIGINS = [o for o in CORS_ORIGINS if o]
