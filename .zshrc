# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

# Path to your oh-my-zsh installation.
export ZSH="/home/devneal/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

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

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

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
ZSH_CUSTOM="$XDG_CONFIG_HOME/zsh/custom"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git globalias_ignore)

source $ZSH/oh-my-zsh.sh

# User configuration
globalias_ignore=(ls grep gcloud gsutil bq)

# Aliases are set in $ZSH_CUSTOM/aliases.zsh

export EDITOR=/usr/bin/nvim
export DOTFILES="$HOME/github/dotfiles"
export FONTS="$XDG_DATA_HOME/fonts"
export SCREENSHOTS="$XDG_DATA_HOME/screenshots"
if [[ ":$PATH:" != *"$HOME/.local/bin"* ]] then
    export PATH="$HOME/.local/bin:${PATH}"
fi
export PATH="$PATH:$(yarn global bin)"

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
xset r rate 200 60

gcloud-shell() {
    docker run --rm \
               --volumes-from gcloud-config \
               -ti \
               -v $(pwd):/project \
               -w /project \
               gcr.io/google.com/cloudsdktool/cloud-sdk
}

gcloud-app-deploy() {
    docker run --rm \
               --volumes-from gcloud-config \
               -ti \
               -v $(pwd):/project \
               -w /project \
               gcr.io/google.com/cloudsdktool/cloud-sdk \
               gcloud app deploy
}
