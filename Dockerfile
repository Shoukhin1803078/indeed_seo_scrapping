FROM python:3.11-slim


WORKDIR /app

# System dependencies (Playwright needs these)
RUN apt-get update && apt-get install -y \
    curl wget gnupg cron \
    libnss3 libatk1.0-0 libatk-bridge2.0-0 libcups2 \
    libxcomposite1 libxdamage1 libxrandr2 libgbm1 \
    libasound2 libpangocairo-1.0-0 libx11-xcb1 \
    libxext6 libxfixes3 libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Copy project
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install Playwright browsers
RUN playwright install --with-deps

# Create data dir (safe)
RUN mkdir -p /app/data

# Default command
# CMD ["scrapy", "crawl", "airregi"]
CMD ["bash", "start.sh"]