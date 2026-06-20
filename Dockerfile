# ── WHAT IS THIS FILE? ──────────────────────────────
# A Dockerfile is a recipe to BUILD a container image.
# It runs once during "docker build" — not at runtime.
# ────────────────────────────────────────────────────

# Step 1: Start from a base image (Python on Alpine)
FROM python:3.9-alpine

# Step 2: Set working directory inside the image
WORKDIR /app

# Step 3: Set environment variables baked into the image
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_ENV=production

# Step 4: Install OS-level dependencies
RUN apk add --no-cache gcc musl-dev linux-headers

# Step 5: Copy and install Python dependencies
# (Done before copying code to leverage Docker layer caching)
COPY requirements.txt .
RUN pip install -r requirements.txt

# Step 6: Copy application source code
COPY . .

# Step 7: Document which port the app listens on
EXPOSE 5000

# Step 8: Command to run when container starts
CMD ["flask", "run"]
