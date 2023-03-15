#!/usr/bin/env zsh

source ~/.config/zpm/zpm.zsh 2>/dev/null || {
  git clone https://github.com/zpm-zsh/zpm ~/.config/zpm
  source ~/.config/zpm/zpm.zsh
}

### Tmux
zpm if ssh load zpm-zsh/tmux
zpm if-not ssh load zpm-zsh/tmux,apply:path

### VTE
zpm if vte load zpm-zsh/vte

### Theme
zpm load mafredri/zsh-async,fpath:/
zpm load sindresorhus/pure,fpath:/

### Plugins
zpm load \
  zpm-zsh/core-config \
  zpm-zsh/ignored-users,async \
  zpm-zsh/check-deps,async \
  zpm-zsh/ls,async \
  zpm-zsh/colorize,async \
  zpm-zsh/ssh,async \
  zpm-zsh/dot,async \
  zpm-zsh/undollar,async \
  zpm-zsh/zsh-history-substring-search,async \
  zpm-zsh/zsh-autosuggestions,async \
  zpm-zsh/fast-syntax-highlighting,async \
  zpm-zsh/history-search-multi-word,async

### Settings: zsh-history-substring-search
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

### Settings: WinCrypt SSH Agent
if [ -n "$WSL_DISTRO_NAME" ]; then
  export SSH_AUTH_SOCK=/tmp/wincrypt-hv.sock
  ss -lnx | grep -q $SSH_AUTH_SOCK
  if [ $? -ne 0 ]; then
    rm -f $SSH_AUTH_SOCK
    (setsid nohup socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork SOCKET-CONNECT:40:0:x0000x33332222x02000000x00000000 >/dev/null 2>&1)
  fi
fi
