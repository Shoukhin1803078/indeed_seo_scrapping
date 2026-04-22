#!/bin/bash

scrapy crawl airregi



# -----------------------------cron job--------------------------------

# echo "⏳ Setting up cron job..."

# # cron job (every 2 min)
# echo "*/2 * * * * cd /app && /usr/local/bin/scrapy crawl airregi >> /app/data/cron.log 2>&1" > /etc/cron.d/scrapy-cron

# chmod 0644 /etc/cron.d/scrapy-cron

# crontab /etc/cron.d/scrapy-cron

# # start cron
# cron

# echo "🚀 Cron started... running every 2 minutes"

# # keep container alive
# tail -f /dev/null