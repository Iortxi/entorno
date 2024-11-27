# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='lsd'
alias cat='batcat'
alias vi='nvim'
alias vim='nvim'
alias catn='/usr/bin/cat'
alias l='ls'
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -lA'
alias attack='/home/iortxi/.config/spectrwm/attack.sh'
alias target='/home/iortxi/.config/spectrwm/target.sh'
alias rm='rm -rf'
alias suspend='sudo systemctl suspend'
alias apagar='shutdown now'
alias internet='timeout 1 ping -c 1 8.8.8.8 &>/dev/null && echo "Hay internet :D" || echo "No hay internet D:"'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Función para vaciar el contenido de un fichero
function limpiar() {
  echo "" > "$1"
}


# Función para extraer los puertos de una captura grepeable de nmap
function extractPorts() {
  ports="$(cat $1 | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' \
    | xargs | tr ' ' ',')"
	ip_address="$(cat $1 | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' \
    | sort -u | head -n 1)"
	echo -e "\n[*] Extracting information...\n" > extractPorts.tmp
	echo -e "\t[*] IP Address: $ip_address"  >> extractPorts.tmp
	echo -e "\t[*] Open ports: $ports\n"  >> extractPorts.tmp
	echo $ports | tr -d '\n' | xclip -sel clip
	echo -e "[*] Ports copied to clipboard\n"  >> extractPorts.tmp
	cat extractPorts.tmp; rm extractPorts.tmp
}


function _update_ps1() {
  estado=$?
  if [ $UID -eq 0 ]; then
    PS1=$(powerline-shell $estado)"\n\[\033[01;31m\]~\[\033[00m\]> "
  else
    PS1=$(powerline-shell $estado)"\n\[\033[01;32m\]~\[\033[00m\]> "
  fi
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
  PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

