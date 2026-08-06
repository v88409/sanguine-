FROM python:3.11-slim
RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg \
    mediainfo \
    && rm -rf /var/lib/apt/lists/*
RUN pip install --upgrade pip
WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
COPY . .
CMD ["python3", "main.py"]
