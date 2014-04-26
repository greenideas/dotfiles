autoload -U colors && colors
autoload -Uz vcs_info
autoload -U compinit && compinit

zstyle ':vcs_info:git*' check-for-changes true
zstyle ':vcs_info:git*' unstagedstr "*"
zstyle ':vcs_info:git*' formats "%{$fg[yellow]%}[%b]%{$reset_color%}%{$fg[red]%}%m%u%c%{$reset_color%}"

precmd() {
  vcs_info
}

setopt prompt_subst
RPROMPT='%{$fg[magenta]%}(`rvm-prompt`)${vcs_info_msg_0_}%{$reset_color%}%'
PROMPT="%{$fg[blue]%}[%~] %{$reset_color%}%# "

source ~/.zsh/aliases   # Bring in my aliases
source ~/.zsh/functions # Load custom functions

export EDITOR='vim'

bindkey -e

# history
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=10000
setopt inc_append_history
setopt share_history

# path stuff
export GEM_HOME='/usr/local/bin'
export GEM_PATH='/usr/local/bin'
export MULBERRY_PATH=$HOME/Toura/mulberry/cli/bin/
export ANDROID_SDK_ROOT=/usr/local/Cellar/android-sdk/r16/

export PATH=/usr/local/bin:/usr/local/sbin:$PATH
# rvm installer added line:
if [ -s ~/.rvm/scripts/rvm ] ; then source ~/.rvm/scripts/rvm ; fi

export PATH=$HOME/local/node/bin:$MULBERRY_PATH:$PATH
export NODE_PATH=/usr/local/lib/jsctags/:$NODE_PATH
fpath=(./zsh-completions $fpath)

# Improve cuke runtime
# REE only
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

source ~/.zsh/secret_keys
