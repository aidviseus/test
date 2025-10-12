#!/usr/bin/env bash
set -euo pipefail

PORT="${PORT:-8000}"

serve_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$serve_dir"

cat <<MSG
Starting simple HTTP server on port $PORT
Open http://localhost:$PORT/index.html in your browser to view the page.
Press Ctrl+C to stop the server.
MSG

python3 -m http.server "$PORT"
