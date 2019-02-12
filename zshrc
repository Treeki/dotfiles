ZSH_THEME="spaceship"

ENABLE_CORRECTION="true"

plugins=(
  git
  vi-mode
  colored-man-pages
  history-substring-search
  zsh-autosuggestions
  zsh_reload
  zsh-navigation-tools
)

znt_list_colorpair="white/black"
znt_list_bold=1

host=$(hostname)
if [ $host = "tres.wuffs.org" ]; then
  export ZSH="/home/ninji/.oh-my-zsh"
elif [ $host = "fucko" ]; then
  export ZSH="/home/ash/.oh-my-zsh"
elif [ $host = "krompfty.lanx" -o $host = "trash" ]; then
  export ZSH="/Users/ash/.oh-my-zsh"
  plugins=($plugins bgnotify osx)
fi

source $ZSH/oh-my-zsh.sh




alias grep='grep --color'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| bat"
alias -g LL="2>&1 | less"
alias H='hexyl'

if [ $host = "tres.wuffs.org" ]; then
  source /usr/share/nvm/init-nvm.sh
elif [ $host = "fucko" ]; then
  eval $(keychain --eval --quiet id_rsa)
fi
