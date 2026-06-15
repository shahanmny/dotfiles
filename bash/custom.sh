# Opens a tmux dev session with claude in a side pane
dev() {
  local session="${1:-dev}"
  if tmux has-session -t "$session" 2>/dev/null; then
    echo "Error: session '$session' already exists. Use 'tmux attach -t $session' to resume it or 'tmux kill-session -t $session' to delete it."
    return 1
  fi
  tmux new-session -d -s "$session" -x "$(tput cols)" -y "$(tput lines)"
  tmux split-window -h -l 30% -t "$session"
  tmux send-keys -t "$session:0.1" 'claude' Enter
  tmux select-pane -t "$session:0.0"
  tmux attach-session -t "$session"
}

# grep running processes
psef() {
  ps -ef | grep "$1"
}

# ssh-agent setup
SSH_ENV="$HOME/.ssh/agent.env"

start_agent() {
  echo "Starting new ssh-agent..."
  rm -rf "$SSH_ENV"
  ssh-agent -s | grep -v '^echo' > "$SSH_ENV"
  chmod 600 "$SSH_ENV"
  source "$SSH_ENV" > /dev/null
}

if [ -f "$SSH_ENV" ]; then
  source "$SSH_ENV" > /dev/null
  if ! ps -p "$SSH_AGENT_PID" > /dev/null 2>&1; then
    echo "ssh-agent PID:${SSH_AGENT_PID} dead, starting new ssh-agent..."
    start_agent
  fi
else
  start_agent
fi

ssh-add -l &>/dev/null || ssh-add ~/.ssh/id_ed25519

# Fixes the ~[200 sequence appearing in WSL during pastes
bind 'set enable-bracketed-paste off'
