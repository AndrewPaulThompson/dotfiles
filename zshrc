# Aliases
alias ll='ls -AGFlh'
alias vim='nvim'
alias grep='grep --color=auto'
alias dev-tmux="~/scripts/dev-tmux.sh"

# Platform.sh CLI configuration
export PATH="$HOME/.platformsh/bin":"$PATH"
. "$HOME/.platformsh/shell-config.rc"

# PHP 7.2
export PATH="/usr/local/opt/php@7.2/bin:$PATH"
export PATH="/usr/local/opt/php@7.2/sbin:$PATH"

# NVM
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Allow functions to be used in prompt
setopt prompt_subst

git_prompt() {
  BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/*\(.*\)/\1/')

  if [ ! -z $BRANCH ]; then
      echo -n " on%F{yellow}$BRANCH"
    if [ ! -z "$(git status --short)" ]; then
      echo " %F{red}✗"
    else
      echo " %F{green}✓"
    fi
  fi
}

prompt_prefix() {
  if [ -d .git ]; then
    echo -n "\ue725"
  else
    echo -n "%#"
  fi
}

PROMPT=$'
%F{32}%n %F{reset}in %F{37}%~%F{reset}$(git_prompt)
%F{244}$(prompt_prefix) %F{reset}'

RPROMPT=''
