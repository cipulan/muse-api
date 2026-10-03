FROM python:3.12-slim

WORKDIR /app

# Install dependencies requirements
COPY muse-proxy/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Install patchright browser & OS dependencies
RUN python -m patchright install --with-deps chromium

# Copy project files
COPY muse-proxy /app
COPY fix-server.patch /app/

# Apply patch
RUN apt-get update && apt-get install -y patch && rm -rf /var/lib/apt/lists/*
RUN patch -p1 < fix-server.patch

EXPOSE 20133

# Run unbuffered
CMD ["python", "-u", "server.py"]