# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Auto change python ENV to current folder VENV
export PYTHON_AUTO_VRUN=true

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="zsh-theme-powerlevel10k/powerlevel10k"

COMPLETION_WAITING_DOTS="true"

plugins=(git colorize python thefuck)

source $ZSH/oh-my-zsh.sh

# User configuration

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Custom Aliases 
# Alias to make sudo work
alias sudo='sudo '

# PS alias does not like space near the equal sign
# Adding color to life
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ip='ip -c'

# Separate cache directory for main laptop (i use arch BTW)
if [ "$(hostname)" = "archlinux" ];then
    alias yay='yay --builddir /mnt/Builderlands/yay --cachedir /mnt/Builderlands/yay'
    alias yaygitup="yay --sudoloop -S  $(yay -Q | grep '\b\w*-git\b' | sed 's/ .*//' | tr '\n' ' ')"
    alias yayclear='yay -Sc'
    alias fixmount='sudo echo "fixing stuff" && sudo ntfsfix -d $(blkid --uuid 0AB6D7BBB6D7A58B) &  sudo ntfsfix -d $(blkid --uuid DA40CF3E40CF205D) &  sudo fsck $(blkid --uuid c07d060a-504b-48c6-a6eb-2aa41c87f8d2) & sleep 2 &&  sudo mount -a'
fi

# Alias for progress bar copy and move
alias mv='mvg -g'
alias cp='cpg -g'

# Alias script to find my phones ip if adb port is open
alias phone-ip="~/.scripts/phone-ip.sh"

# Yazi directory follow command
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Initialization of zoxide
eval "$(zoxide init zsh)"

# Goofy shit
alias sus="echo '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⣀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠶⠞⠉⠉⠁⠀⠀⠀⠀⠉⠉⠙⠒⠦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣾⣯⣤⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠳⣤⡀⠀⠀⠀⠀⠀
⣶⡄⠀⠀⠀⠀⢀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⠞⠋⠉⠀⠀⠀⠀⠀⠀⠉⠉⠛⠓⠢⠤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢦⡀⠀⠀⠀
⢹⣷⢤⡤⠶⣾⣿⠻⠿⢷⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⢶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⡄⠀⠀
⠀⠉⠛⠛⠉⠉⠉⠉⠓⢦⡉⠻⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⡆⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⡆⠘⣧⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⠷⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡄
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡄⠹⡄⠀⠀⠀⠀⠀⠀⢠⡾⠁⠀⠀⠉⠓⠶⢤⣀⣀⣀⠀⠀⠀⠀⠀⢀⣀⡴⠞⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣇
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢷⠀⢻⡀⠀⠀⠀⠀⢰⢏⣠⡤⣶⡒⢲⣶⠦⣤⣤⣍⡉⠉⠉⠉⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣧⠈⢧⡀⠀⠀⠐⣿⠋⣠⡟⢹⣷⡞⠉⣷⡾⠛⣦⣹⣿⠲⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢶⣌⠳⣄⡀⠀⠙⢿⣿⣧⠟⣿⣧⡾⣿⣦⡾⡟⢀⣼⣷⠉⣻⠳⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡟
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠷⣮⣝⠒⠶⣾⡿⢿⣶⣿⣥⣄⣈⡉⠀⠹⠟⠋⣧⡴⢿⠋⣻⠻⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡼⠁
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠛⢻⢿⣤⣦⣀⠀⠀⠈⠙⠛⢦⣤⡀⠀⠀⠸⣶⣿⢖⣻⣧⢹⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⡃⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣾⣠⡏⠈⠉⠲⢦⣀⣀⢹⣌⣿⣦⡀⠀⠉⠿⠛⠛⢾⡆⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠋⠻⣆
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⢻⣿⣿⠙⣇⠀⠀⠀⠀⠙⢯⣫⣏⣯⣎⢷⡀⠀⠀⠀⠀⣼⣴⣶⠀⠀⠀⠀⠀⠀⠀⢀⡼⠁⠀⢀⣿
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣶⠿⣿⠈⢻⣿⣿⢻⣇⢀⣤⠀⣠⣼⡟⢻⡛⠉⠉⣣⡀⠀⡀⣰⣿⠁⣿⠀⠀⠀⠀⠀⠀⣠⠟⠁⠀⢀⣾⠃
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡼⠹⣤⡈⠳⠶⠛⣇⠀⣿⡟⢻⣷⠛⢿⣷⡟⣿⣠⠟⣿⣷⡾⣿⣿⡏⢠⣿⡦⠀⠀⠀⣀⣴⠋⠀⠀⣰⡿⠁⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠻⠯⣗⣶⠤⣌⣏⣁⣷⡞⠹⠦⠜⠛⠶⠟⢻⣄⣽⣏⣿⣿⠟⡇⣼⣿⣧⣄⠀⠀⣿⠁⠀⢀⣼⠟⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠈⠙⠛⠓⠿⢿⣿⣿⣿⣿⣶⣶⣦⡤⠿⠼⠟⠛⠋⠀⠙⢻⣧⣿⣿⠀⢠⣼⠂⠀⣼⠟⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠉⠈⠁⠀⣾⠁⠀⢸⡧⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣽⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⠀⠀⣸⡏⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⢧⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣤⠞⠋⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠒⢦⡤⢤⡤⠤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡆⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡀⠀⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⢸⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⢻⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠘⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⢤⣀⡀⠀⠀⠀⠀⠀⣀⡼⠁⠀⠀⠀⢹⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡿⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠉⠉⠉⠁⠀⠀⠀⠀⠀⠈⢷⡀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡾⠃⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠶⠦⠤⠤⠤⠤⠶⠞⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀'"

# pnpm
export PNPM_HOME="/home/jkholick/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
