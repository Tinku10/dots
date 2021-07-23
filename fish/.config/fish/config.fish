set ylw   $'\x1b[33m' # Sets text to black
set blk   $'\x1b[90m' # Sets text to black
set red   $'\x1b[31m' # Sets text to red
set grn   $'\x1b[92m' # Sets text to green
set lylw  $'\x1b[93m' # Sets text to yellow
set blu   $'\x1b[94m' # Sets text to blue
set pur   $'\x1b[95m' # Sets text to purple
set cyn   $'\x1b[96m' # Sets text to cyan
set wht   $'\x1b[97m' # Sets text to white
set rst   $'\x1b[0m'  # resets to default terminal color
set grey  $'\x1b[90m'
set bold  $'\x1b[1m'

# stress test for C++ (stress filename)
function stress() 
    set file $1
    set i 1
    while true; do
        echo $i
        ./gen $i > int || break
        # ./a < int > out1
        # ./brute < int > out2
        # diff -w out1 out2 || break
        diff -w <(./$file < int) <(./brute < int) || break
        i++
    end
    # bash /mnt/d/PersonalFiles/Codes/CP/s.sh 
end

# compile C++ code with the given filename
function make() 
    set filename $1
    g++ -std=c++17 $filename.cpp -Wall -Wextra -Wshadow -fsanitize=address -fsanitize=undefined -Wshift-overflow -D_GLIBCXX_DEBUG  -fno-omit-frame-pointer  -o  "${filename}"
end

function makef() 
    set filename $1
    g++ -std=c++17 $filename.cpp -Wall -fsanitize=address -fsanitize=undefined -Wshift-overflow -o  "${filename}"
end

#generate test cases for stress testing
function generate() 
    set var "#include <algorithm>
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
    set dir $(pwd)
    $(touch gen.cpp)
    echo $var > $dir/gen.cpp

end

# runs a compiled file to give input and output different color
function runs() 
  set arg $1
  $(touch ans)
  echo -n ${pur} 
  ./$arg > ans
  echo -n ${rst}
  echo -n ${bold}${blu} 
  cat ans
  echo -n ${rst}
  rm ans
end

# print a list of commands for competitive programming
function cpcom()
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
end

function goto()
    set dir ${1:-""};
    if [ -z "$dir" ] 
    then
        cd ~/Documents/CP/
    else
        cd ~/Documents/CP/contest/
        cd $dir
    end 
end

# using vim mode in zsh with jj key in place of ESC
fish_vi_key_bindings

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias theme-reset="kitty @ --to unix:/tmp/kitty set-colors --reset"
alias theme="cd ~/.config/kitty/kitty-themes && fzf --height 40% --preview 'head -n 40 {} && kitty @ --to unix:/tmp/kitty set-colors -a -c {}'; cd -"
alias tmux='tmux -u'

# launch neofetch on startup
# neofetch

# pfetch configs
set PF_SOURCE "~/.pfetch"

pfetch

