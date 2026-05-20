#!/bin/bash
# Usage: ./send.sh "msg-037" "Title" "Body text"
set -e

ID="$1"
TITLE="$2"
BODY="$3"

if [ -z "$ID" ] || [ -z "$TITLE" ] || [ -z "$BODY" ]; then
  echo "Usage: ./send.sh <id> <title> <body>"
  exit 1
fi

# Write notification
cat > notifications.json <<EOF
{
  "id": "$ID",
  "title": "$TITLE",
  "body": "$BODY"
}
EOF

git add notifications.json
git commit -m "$ID: $BODY"
git push

# Purge jsDelivr CDN
echo "Purging CDN..."
curl -s "https://purge.jsdelivr.net/gh/xason0/xromusic-updates@master/notifications.json" | python3 -c "import sys,json; r=json.load(sys.stdin); print('CDN purged:', r['status'])"
curl -s "https://purge.jsdelivr.net/gh/xason0/xromusic-updates@master/update.json" | python3 -c "import sys,json; r=json.load(sys.stdin); print('update.json purged:', r['status'])"

echo "Sent: $ID"
