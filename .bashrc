#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export PATH="$HOME/development/flutter/bin:$PATH"
export PATH="$PATH:/usr/lib/jvm/java-17-openjdk/bin"
export ANDROID_HOME=/home/ripple/development/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export EDITOR=nano
export VISUAL=nano

alias f='killall msedge && poweroff'
alias s='systemctl suspend & swaylock'
alias bootorder='sudo efibootmgr -o 0001,0003,2001,2002,2003'
alias mountc='sudo mount /dev/nvme0n1p2 /mnt/c'
alias mountd='sudo  mount /dev/nvme0n1p4 /mnt/d'

alias pods='~/.config/hypr/scripts/connect_airpods.sh'
alias nopods='sudo systemctl stop bluetooth.service'
