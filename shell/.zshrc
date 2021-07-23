# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
# Path to your oh-my-zsh installation.
export ZSH="/home/tinku/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="alanpeabody"

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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
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
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

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
ylw=$'\x1b[33m' # Sets text to black
blk=$'\x1b[90m' # Sets text to black
red=$'\x1b[31m' # Sets text to red
grn=$'\x1b[92m' # Sets text to green
lylw=$'\x1b[93m' # Sets text to yellow
blu=$'\x1b[94m' # Sets text to blue
pur=$'\x1b[95m' # Sets text to purple
cyn=$'\x1b[96m' # Sets text to cyan
wht=$'\x1b[97m' # Sets text to white
rst=$'\x1b[0m'  # resets to default terminal color
grey=$'\x1b[90m'
bold=$'\x1b[1m'

# stress test for C++ (stress filename)
stress() {
    file=$1
    for ((i = 1; ; ++i)); do
        echo $i
        ./gen $i > int || break
        # ./a < int > out1
        # ./brute < int > out2
        # diff -w out1 out2 || break
        diff -w <(./$file < int) <(./brute < int) || break
    done
    # bash /mnt/d/PersonalFiles/Codes/CP/s.sh 
}

# compile C++ code with the given filename
make() {
    filename=$1
    g++ -std=c++17 $filename.cpp -Wall -Wextra -Wshadow -fsanitize=address -fsanitize=undefined -Wshift-overflow -D_GLIBCXX_DEBUG  -fno-omit-frame-pointer  -o  "${filename}"
}
makef() {
    filename=$1
    g++ -std=c++17 $filename.cpp -Wall -fsanitize=address -fsanitize=undefined -Wshift-overflow -o  "${filename}"
}

#generate test cases for stress testing
generate() {
    var="#include <algorithm>
#include <bits/stdc++.h>
using namespace std;
int rand(int a, int b) {
    return a + rand() % (b - a + 1);
}
int main() {
    srand(time(NULL));
    std::random_device rd;
    std::mt19937 g(rd());
}
    "
    dir=$(pwd)
    $(touch gen.cpp)
    echo $var > $dir/gen.cpp

}

# runs a compiled file to give input and output different color
runs() {
  arg=$1
  $(touch ans)
  echo -n ${pur} 
  ./$arg > ans
  echo -n ${rst}
  echo -n ${bold}${blu} 
  cat ans
  echo -n ${rst}
  rm ans
}

# print a list of commands for competitive programming
cpcom(){
    echo
    echo -e "${grn}$ ""${bold}run problem ${grey}<name of the problem(s)>${rst}  -> ${wht}parses the problem from the OJ ${rst}"
    echo -e "${grn}$ ""${bold}run contest ${grey}<number of problems>${rst}      -> ${wht}parses the defined number of problems from a contest${rst}"
    echo -e "${grn}$ ""${bold}run test    ${grey}<no arguments>${rst}            -> ${wht}test your code against the sample test cases parsed from the OJ${rst}"
    echo -e "${grn}$ ""${bold}make        ${grey}<filename>${rst}                -> ${wht}compiles the C++ code with the predefined flags${rst}"
    echo -e "${grn}$ ""${bold}makef       ${grey}<filename>${rst}                -> ${wht}same as make, but faster${rst}"
    echo -e "${grn}$ ""${bold}runs        ${grey}<filename>${rst}                -> ${wht}runs the compiled file with input and output coloring${rst}"
    echo -e "${grn}$ ""${bold}generate    ${grey}<no arguments>${rst}            -> ${wht}generates a gen file to run stress test${rst}"
    echo -e "${grn}$ ""${bold}stress      ${grey}<filename>${rst}                -> ${wht}runs stress test comparing <filename>.cpp to brute.cpp${rst}"
    echo
}

goto(){
    dir=${1:-""};
    if [ -z "$dir" ] 
    then
        cd ~/Documents/CP/
    else
        cd ~/Documents/CP/contest/
        cd $dir
    fi
}

source ~/Documents/projects/scripts/kitty_sessions_fzf.sh

function go(){
  cd $(ls ~ -d */* | fzf --height=20 --border=sharp)
}

# using vim mode in zsh with jj key in place of ESC
bindkey jj vi-cmd-mode

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias theme-reset="kitty @ --to unix:/tmp/kitty set-colors --reset"
alias theme="cd ~/.config/kitty/kitty-themes && fzf --height 40% --preview 'head -n 40 {} && kitty @ --to unix:/tmp/kitty set-colors -a -c {}'; cd -"
alias tmux='tmux -u'

# launch neofetch on startup
# neofetch

# pfetch configs
PF_SOURCE="~/.pfetch"
pfetch
