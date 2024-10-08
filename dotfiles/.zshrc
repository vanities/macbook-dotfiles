# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

zstyle ':omz:update' mode auto
# Path to your oh-my-zsh installation.
export SHELL="/bin/zsh"
export ZSH="/Users/vanities/.oh-my-zsh"
export PATH="/opt/homebrew/bin:$PATH"
export PATH=" $NIX_PATH:$PATH"
#export ZSH_TMUX_AUTOSTART=1

#
export TERM="xterm-256color"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME=powerlevel10k/powerlevel10k
#source ~/.purepower
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon user dir_writable dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time root_indicator background_jobs time disk_usage ram)
#POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
#POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
#POWERLEVEL9K_USER_ICON="\uF415" # 
POWERLEVEL9K_ROOT_ICON="\uF09C"
#POWERLEVEL9K_SUDO_ICON=$'\uF09C' # 
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"
#POWERLEVEL9K_VCS_GIT_ICON='\uF408 '
#POWERLEVEL9K_VCS_GIT_GITHUB_ICON='\uF408 '

ZSH_DISABLE_COMPFIX=true

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

#Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

#Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(gitfast pip sudo tmux macos python brew docker docker-compose command-not-found common-aliases zsh-autosuggestions zsh-autocomplete zsh-syntax-highlighting fast-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"

alias ls="lsd"
alias lt="lsd --tree"
alias ll="lsd -al"

source $ZSH/oh-my-zsh.sh

alias suroot='sudo -E -s'
alias see_ms='heroku logs -t -a minary-api-prod -d router |awk "{print $11}"'

# source ~/.bash_profile

if [ -f ~/.bash_profile ]; then
    . ~/.bash_profile;
  fi

alias ip='ifconfig | grep "inet " | head -n 2 | tail -1 | cut -d " " -f2'
alias lsblk='diskutil list'

alias gpm="git pull origin master; git pull origin main"
alias gcm="git checkout master; git checkout main"

# terraform
alias tf="terraform"
alias tfi="terraform init"
alias tfa="terraform apply"
alias tfd="terraform destroy"
alias tfp="terraform plan"
alias tff="terraform fmt"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/vanities/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/vanities/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/vanities/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/vanities/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
export GPG_TTY=`tty`
source ~/.fastlane/completions/completion.sh
export PATH="/usr/local/opt/ruby/bin:$PATH"
eval "$(rbenv init - zsh)"
export GEM_HOME="$HOME/.gem"

alias ffuser="nvim /Users/vanities/Library/Application\ Support/Firefox/Profiles/1euh1l13.default-release/user.js"
alias ddusblinux="sudo dd bs=4M if=/path/to/manjaro.iso of=/dev/sd[drive letter] status=progress oflag=sync"
alias ddusbmac="sudo dd bs=4m if=/dev/rdisk4 of=miner.iso"
alias ddtousbmac="sudo dd bs=4m if=miner.iso of=/dev/rdisk4"
alias unmount="sudo diskutil unmount /dev/disk3s1"
alias gitclean="git branch --merged main | grep -v '^[ *]*main$' | xargs git branch -d"


export PATH="/Library/TeX/texbin:$PATH"
export y="yarn"

source "$HOME/.cargo/env"

export PATH="$PATH:/Users/vanities/.foundry/bin"
bindkey '^I'   complete-word       # tab          | complete
bindkey '\t' autosuggest-accept  # shift + tab  | autosuggest
export ZSH_AUTOSUGGEST_STRATEGY=(
    history
    completion
)
ZSH_AUTOSUGGEST_USE_ASYNC=true
zstyle ':autocomplete:tab:*' widget-style menu-select

alias wip="curl icanhazip.com"

alias makemkvcon="/Applications/MakeMKV.app/Contents/MacOS/makemkvcon"
alias makemkv="/Applications/MakeMKV.app/Contents/MacOS/makemkv"

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

export PATH="$PATH:/run/current-system/sw/bin"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
