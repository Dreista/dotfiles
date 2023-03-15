# Initialize Starship
if type -q starship
  starship init fish | source
end

# Load WinCrypt SSH Agent
set -x SSH_AUTH_SOCK "/tmp/wincrypt-hv.sock"
if not ss -lnx | grep -q $SSH_AUTH_SOCK;
  rm -f $SSH_AUTH_SOCK
  setsid nohup socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork SOCKET-CONNECT:40:0:x0000x33332222x02000000x00000000 >/dev/null 2>&1 & disown
end
