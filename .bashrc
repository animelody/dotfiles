# .bashrc
[[ -f /etc/bash.bashrc ]]&&. /etc/bash.bashrc
_profile="$HOME/.bash_profile"
_bashrc="$HOME/.bashrc"
_cfg="$HOME/.config"
[[ -d $HOME/.i3 ]]&&_i3="$HOME/.i3"||[[ -d $_cfg/i3 ]]&&_i3="$_cfg/i3"
[[ -d $HOME/.${USER} ]]&&_id="$HOME/.$USER"
[[ -d $_id/tv ]]&&_tv="$_id/tv"
[[ -d $_id/dpt ]]&&_dpt="$_id/dpt"
[[ -d $_id/lit ]]&&_lit="$_id/lit"
[[ -d $_id/dls ]]&&_dls="$_id/dls"
[[ -d $_id/mu ]]&&_mu="$_id/mu"
[[ -d $_id/code ]]&&_co="$_id/code"||[[ -d $_id/code/biz ]]&&_biz="$_id/code/biz"
[[ -f $HOME/.config/termite/config ]]&&_term="$HOME/.config/termite/config"
[[ -f $HOME/.config/polybar/config ]]&&_poly="$HOME/.config/polybar/config"
[[ -f $HOME/.xinitrc ]]&&_xinit="$HOME/.xinitrc"
[[ -f $HOME/.conkyrc ]]&&_conky="$HOME/.conkyrc"
[[ -f $HOME/.Xresources ]]&&_xrsrcs="$HOME/.Xresources"
export PATH=$PATH:$HOME/.local/bin:$HOME/.local/sbin:
export VISUAL=/sbin/vim
export EDITOR=/sbin/vim
export SUDO_EDITOR=/sbin/vim
PS1=' \[\e[1;38;5;6m\][\[\e[1;38;5;0m\]\u\[\e[1;38;5;1m\]@\[\e[1;38;5;0m\]\h \[\e[1;38;5;1m\]\w\[\e[1;38;5;6m\]]\[\e[1;38;5;1m\]\$\[\e[0m\] '
md(){ markdown $i>${i}.html&&firefox ${i}.html;}
ws(){ grep -o .<<<$1;}
vi(){ case $1 in 3) vim $_i3/config;i3-msg restart;;b) vim $_profile;. $_profile;;c) vim $_conky;;p)vim $_poly;i3-msg restart;;r) vim $_bashrc;. $_bashrc;;t) vim $_term;;x) vim $_xrsrcs;xrdb -merge $_xrsrcs;;*) vim $@;;esac;}
gi(){ o="$1";shift;case "$o" in a) git add "$@";;c) git clone "$@";;i) git init "$@";;m) git commit -m "$@";;p) git pull "$@";;r) git add "$@";;s) git push --set-upstream "$@";;u) git push -u "$@";;esac;unset o;}
aur(){ git clone https://aur.archlinux.org/$1&&cd $1&&makepkg -Acsi&&cd ..&&rm -rf $1;}
c(){ case "$1" in c)cd $_cfg;;d)cd $_dpt;;i)cd $_id;;l)cd $_lit;;v)cd $_tv;;m)cd $_mu;;w)cd $_dls;;z)cd $_biz;;*)cd "$@";;esac;}
u(){ cd ..$(printf "/%s/%s" $(seq 1 $1|sed 's/[0-9]*/../g'));}
b(){ cd ..$(printf "/%s/%s" "${@// /\ }");}
ssh_env_init(){	ssh-agent|sed '/^echo/d'>$HOME/.ssh/env;chmod 600 $HOME/.ssh/env;. $HOME/.ssh/env>/dev/null;ssh-add;}
clr(){ n=${1:-16};for i in $(seq ${2:-0} $n ${3:-255});{ for j in $(seq $i $((i+(n-1))));{ printf "\e[38;5;%d;1m %03d \e[0m" $j $j;};printf "\n";};unset n;}
alias mpk='mpv --title "mpv_kids" --fullscreen --loop-playlist'
alias mpkk='killall mpv;mpk'
alias cp='cp -r'
alias v='vi'
alias mkd='mkdir -p'
alias rr='rm -rf'
alias rf='rm -rf'
alias l='ls --color=auto'
alias l.='l -A'
alias ll='l -hl'
alias .l='l -Alh'
alias df='df -h'
alias du='du -h --max-depth=1'
alias scp='scp -o "ForwardAgent yes"'
alias myclr='echo;clr 8 0 15;echo;clr 10 130 139;echo;clr 5 100 129;echo'
alias allclr='clr 8 0 15;clr 6 16 99;clr 5 100 139;clr 6 140 231;clr 12 232 255'
alias kiddl="youtube-dl -f 'bestvideo[height<=480]+bestaudio/best[height<=480]'"
#&&ssh_env_init||ssh-add -L &> /dev/null&&ssh-add
alias fmpv="mpk --sid 1 --aid 2 --start +1:30 /videos/a/Full\ Metal\ Panic\ Complete\ Blu\ Ray\ 720p/Full\ Metal\ Panic/Full\ Metal\ Panic\ *"
