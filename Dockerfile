FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

EXPOSE 5000

# NOTE: Running as root intentionally for demo (will be flagged by security tools)
USER root

CMD ["python", "app.py"]
