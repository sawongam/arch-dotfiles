#
# ~/.bashrc
#

[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export PATH="$HOME/development/flutter/bin:$PATH"
export PATH="$PATH:/usr/lib/jvm/java-17-openjdk/bin"
export ANDROID_HOME=/home/ripple/development/Android/

export EDITOR=nano
export VISUAL=nano

alias f='poweroff'
alias s='systemctl suspend & swaylock'
alias bootorder='sudo efibootmgr -o 0001,0000,2001,2002,2003'
alias mountc='sudo mount /dev/nvme0n1p2 /mnt/c && thunar /mnt/c'
alias mountd='sudo mount /dev/nvme0n1p3 /mnt/d && thunar /mnt/d'
alias mountusdb='sudo mount /dev/nvme0n1p7 /mnt/usb && thunar /mnt/usb'

alias pods='~/.scripts/connect_pods.sh'
alias nopods='sudo systemctl stop bluetooth.service'
