#!/usr/bin/env bash
set -e

# Start the Flask application in a tmux session
tmux new-session -d -s eval_app "python3 eval_tool.py"

# Wait for Flask to start
sleep 5

# Start ngrok in another tmux session
tmux new-session -d -s eval_ngrok "ngrok authtoken $FLASK_AT && ngrok http --url=still-frog-guided.ngrok-free.app 19198"

echo "Flask app started in tmux session 'eval_app'."
echo "ngrok started in tmux session 'eval_ngrok'."

# Keep the container running
tail -f /dev/null
