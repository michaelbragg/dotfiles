if [[ -n $SSH_CONNECTION ]]; then
  export PS1='%m:%3~$ '
else
  export PS1='%3~$ '
fi

export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

#fpath=($ZSH/zsh/functions $fpath)

#autoload -U $ZSH/zsh/functions/*(:t)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS

source $(brew --prefix)/share/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle heroku
antigen bundle command-not-found
#antigen bundle autojump
#antigen bundle npm
antigen bundle git-extras
antigen bundle git-flow
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

plugins=(git npm github zsh-syntax-highlighting zsh-autosuggestions git-open)
