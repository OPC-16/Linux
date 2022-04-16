#        ███████        ██████╗  ██████╗
#             ██        ██╔══██╗██╔════╝
#           ██   ██████ ██████╔╝██║     
#         ██            ██╔══██╗██║     
#        ███████╗       ██║  ██║╚██████╗
#         ╚═════╝       ╚═╝  ╚═╝ ╚═════╝

# Use powerline 
USE_POWERLINE="true"
# Source manjaro-zsh-configuration.........I will put these files in home directory (here on Github)
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt........I will put these files in home directory (here on Github)
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

## ALIASES ##......................................................................

alias p='sudo pacman'
alias cls='clear && date' ## it will clear and display date and time
alias ls='ls -hN --color=auto --group-directories-first'

# use move,copy and remove interactively...i.e. it prompt you yes/no like confirmation
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'

# use lf to change directories
alias l='lfcd'

# Directories I often visit...so aliased them
alias mov='cd /home/omkar/D-drive/OPC/Mov'
alias big='cd /home/omkar/D-drive/OPC/Ser/Big\ Bang\ Theory/season\ 10'
alias tele='cd /home/omkar/Downloads/Telegram\ Desktop'
alias c='cd /home/omkar/O-Drive/C-Programming/'

# alias to open Head First C book
alias head='okular /home/omkar/O-Drive/College\ Books/Head_First_C.pdf'

alias music='cd /home/omkar/Music'

alias cmatrix='cmatrix -C blue'

alias rmrfi='rm -rfi'

alias v='vlc'
#alias r='ranger'

# aliases to create ok.c and lol.c in vim
alias ok='vim ok.c'
alias lol='vim lol.c'

# Can use shutdown and reboot through terminal
alias shutdown='shutdown now'
alias reboot='sudo reboot now'

alias e='exit'


##Automatically do an ls after each cd..................
 cd ()
 {
 	if [ -n "$1"  ]; then
 		builtin cd "$@" && ls
 	else
 		builtin cd ~ && cls
 	fi

 }

 # sox is the termianl music player I use
 ##replacing play command of sox with just sox..........
 sox ()
 {
	 if [ -n "$1" ]; then
		play "$@"
	 fi
 }

#using lf to change the directories
 lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

 ## vim mode ---------------------------------------------
# bindkey -v

# Change cursor shape for different vi modes.
#function zle-keymap-select {
#  if [[ ${KEYMAP} == vicmd ]] ||
#     [[ $1 = 'block' ]]; then
#    echo -ne '\e[1 q'
#  elif [[ ${KEYMAP} == main ]] ||
#       [[ ${KEYMAP} == viins ]] ||
#       [[ ${KEYMAP} = '' ]] ||
#       [[ $1 = 'beam' ]]; then
#    echo -ne '\e[5 q'
#  fi
#}
#zle -N zle-keymap-select
#zle-line-init() {
#    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
#    echo -ne "\e[5 q"
#}
#zle -N zle-line-init
#echo -ne '\e[5 q' # Use beam shape cursor on startup.
#preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.


#--------------------------------THE BAD-ASS CONFIG----------------------------------------------------------

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace

# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# use vim key bindings in terminal
set -o vi

# see the system info
clear

printf "\n"
printf "   %s\n" "IP ADDRESS -- $(curl ifconfig.me)"
printf "   %s\n" "USER ++++++++ $(echo $USER)"
printf "   %s\n" "DATE -------- $(date)"
printf "   %s\n" "UPTIME ++++++ $(uptime -p)"
printf "   %s\n" "HOSTNAME ---- $(hostname -f)"
printf "   %s\n" "CPU +++++++++ Intel i3-7100 (4) @ 3.9GHz" 
printf "   %s\n" "GPU --------- Intel HD Graphics 630" 
printf "   %s\n" "KERNEL ++++++ $(uname -rms)"
printf "   %s\n" "PACKAGES ---- $(pacman -Q | wc -l) (pacman)"
printf "   %s\n" "RESOLUTION ++ $(xrandr | awk '/\*/{printf $1" "}')"
printf "   %s\n" "RAM --------- $(free -h | awk '/Mem/{print $3"/"$2}')"
printf "   %s\n" "MEMORY ++++++++ Size  Used Avail Use%"
printf "   %s\n" "$(df -h | grep sda2)"
printf "\n" 
sleep 1
printf "   %s\n" "Hello Omkar ! :)"
