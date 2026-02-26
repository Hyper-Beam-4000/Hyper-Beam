FROM python:3.13-slim
WORKDIR /app
COPY requirements.txt backend/requirements.txt
COPY . .
RUN pip install --no-cache-dir -r backend/requirements.txt -r requirements.txt
CMD ["uvicorn", "backend.main:app", "--host", "0.0.0.0", "--port", "8000"]
