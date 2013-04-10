# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="blinks"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git gem brew heroku npm osx zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

#
# Run our main shell configuration
#
function source_if_exists {
    file=${1}
    
    if [ -f ${file} ]; then
        source ${file}
    fi
}
source_if_exists ~/.shell_aliases.sh
source_if_exists ~/.shell_environment.sh
source_if_exists ~/.shell_functions.sh

#
# load scm_breeze
#
[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

#
# rvm insists on .zlogin for this, but that doesnt get called when executing zsh manually from bash
# TODO: is there a way to do this that makes more sense? (this seems redundant)
#
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#
# Let this rvm shit live here instead of main configuration, 
# cuz rvm installer is annoying and re-adds them!
#
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

#
# for iterm2 "reuse previous tab's directory" feature, make sure rvmrc is run when new tab opens
#
if [ -s "$HOME/.rvm/scripts/rvm" ]; then
  __rvm_project_rvmrc
fi

#
# add npm global binaries to path.
# for some reason homebrew doesn't like to do this automatically
# REMINDER: periodically check if homebrew has decided to handle this and remove from here if so
#
PATH=$PATH:/usr/local/share/npm/bin
