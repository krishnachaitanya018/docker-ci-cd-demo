# ---- Base image ----
FROM python:3.12-slim AS base

# Set working directory
WORKDIR /app

# Install system dependencies (optional, but common)
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    && rm -rf /var/lib/apt/lists/*

# ---- Install Python dependencies ----
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# ---- Copy app code ----
COPY app/ /app

# Expose app port
EXPOSE 8000

# Default command
CMD ["python", "main.py"]
