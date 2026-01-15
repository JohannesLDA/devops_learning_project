# 1. Base image – start from existing image
FROM python:3.11-slim

# 2. Set working directory inside container
WORKDIR /app

# 3. Copy dependency file first (caching optimization)
COPY requirements.txt .

# 4. Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy application code
COPY app/ ./app/

# 6. Expose port (documentation, doesn't publish)
EXPOSE 5000

# 7. Command to run when container starts
CMD ["python", "app/main.py"]
