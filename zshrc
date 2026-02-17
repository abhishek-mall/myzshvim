[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme

export LANG=en_US.UTF-8
export EDITOR='vim'
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=fg:#d0d0d0,bg:#121212,hl:#5f87af
--color=fg+:#ffffff,bg+:#262626,hl+:#5fd7ff
--color=info:#afaf87,prompt:#d7005f,pointer:#af5fff
--color=marker:#87ff00,spinner:#af5fff,header:#87afaf'

export FZF_CTRL_R_OPTS="--sort --exact"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST

setopt PROMPT_SUBST
setopt NO_BEEP
setopt AUTO_CD
setopt HIST_IGNORE_DUPS

function parse_git_data() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo " $(echo ${ref#refs/heads/}) "
}

function return_status() {
  echo "%(?..%F{red}✘ %f)"
}

PROMPT='%K{33}%F{255} %1~ %f%k%F{33}%K{235}%f%F{255} $(parse_git_data)%f%k%F{235}%f '

RPROMPT='$(return_status)%F{240} %T %f'

alias c='clear'
alias ll='ls -lGh'
alias ~="cd ~"
alias ..='cd ..'
alias v='vim'

bindkey -v
export KEYTIMEOUT=1

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]]; then
    echo -ne '\e[1 q'
  else
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
  zle -K viins
  echo -ne "\e[5 q"
}
zle -N zle-line-init

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'
bindkey '^e' autosuggest-accept
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias ls='eza --icons --group-directories-first'
alias ll='eza --icons -l --git --group-directories-first --time-style=long-iso'
alias tree='eza --icons --tree --level=2'

alias cat='bat'

export FZF_CTRL_T_OPTS="
  --preview 'if [ -d {} ]; then eza --tree --level=2 --icons {}; else bat --style=numbers --color=always --line-range :500 {}; fi'
  --preview-window=right:60%:wrap
  --height=80%
  --bind '?:toggle-preview'
"

alias p='fzf'

