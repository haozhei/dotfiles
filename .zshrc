# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# good ones: dieter, dst, gentoo, geoffgarside, half-life, jaischeema
ZSH_THEME="kphoen"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="/usr/local/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"

# Build and run a CMake project
# Usage: br [-c] [-d] <AppName>
# -c to clean before build
# -d to build with debug
br() {
    local clean=0
    local debug=0
    local app_name

    # Reset OPTIND to ensure getopts works correctly if function is called multiple times in a session
    OPTIND=1

    # Options
    while getopts ":c:d:" opt; do
        case $opt in
            c)
                clean=1
                app_name=$OPTARG
                ;;
            d)
                debug=1
                app_name=$OPTARG
                ;;
            \?)
                echo "Invalid option: -$OPTARG" >&2
                return 1
                ;;
            :)
                echo "Option -$OPTARG requires an argument." >&2
                return 1
                ;;
        esac
    done

    # Default
    if [[ $OPTIND -eq 1 ]]; then
        if [[ -z "$1" ]]; then
            echo "Usage: br [-c] [-d] <AppName>"
            return 1
        fi
        app_name="$1"
    fi

    local build_dir="./build"

    # Create / clean
    if [[ $clean -eq 1 ]]; then
        echo "Cleaning and rebuilding the application..."
        rm -rf "$build_dir"
        mkdir "$build_dir"
    elif [[ ! -d "$build_dir" ]]; then
        mkdir "$build_dir"
    fi

    # Make
    pushd "$build_dir"
    if [[ $debug -eq 1 ]]; then
        cmake -DCMAKE_BUILD_TYPE=Debug ..
    else
        cmake -DCMAKE_BUILD_TYPE=Release ..
    fi
    make
    if [[ $? -eq 0 ]]; then
        echo "Running $app_name..."
        ./"$app_name"
    else
        echo "Build failed"
    fi
    popd
}

# Shortcut for gh/online-judge-tools/oj
# Usage: ojt [-r] <FilenameNoExtension> 
# -r to delete the .out file generated
ojt() {
    local remove_out=0
    local file

    # Reset OPTIND to ensure getopts works correctly if the function is called multiple times in a session
    OPTIND=1

    # Options
    while getopts ":r" opt; do
        case ${opt} in
            r )
                remove_out=1
                ;;
            \? )
                echo "Invalid option: -$OPTARG" >&2
                return 1
                ;;
            : )
                echo "Option -$OPTARG requires an argument." >&2
                return 1
                ;;
        esac
    done
    shift $((OPTIND -1))

    # Default
    if [[ -z "$1" ]]; then
        echo "Usage: ojt [-r] <FilenameNoExtension>"
        return 1
    fi

    file="$1.cpp"

    # Compile and run the tests
    g++-13 "$file" -std=c++20 && oj t

    if [[ $remove_out -eq 1 ]]; then
        rm -f a.out "$1.out"
    fi
}

# Quick browser windows

alias ggh="open 'https://github.com'"

alias ggl="open 'https://gitlab.com'"

alias gch="open 'https://itch.io'"

alias gpt="open 'https://chatgpt.com'"

alias gcl="open 'https://claude.ai/new'"

go() {
    local url="https://${1}"
    open "$url"
}
