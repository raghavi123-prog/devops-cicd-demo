# Base image with Python runtime
FROM python:3.9-slim

# Set working directory inside the container
WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy all application files
COPY . .

# Expose Flask's port
EXPOSE 5000

# Command to run the application
CMD ["python", "app.py"]
