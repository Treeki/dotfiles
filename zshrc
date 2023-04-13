# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# for brew completion
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

function fd() {
  if [ -t 1 ]; then
    env fd -c always $* | less -RF
  else
    env fd $*
  fi
}

function rg() {
  if [ -t 1 ]; then
    env rg --color always $* | less -RF
  else
    env rg $*
  fi
}

#ZSH_THEME="spaceship"
ZSH_THEME="powerlevel10k/powerlevel10k"
ZLE_RPROMPT_INDENT=0

ENABLE_CORRECTION="true"

plugins=(
  docker
  docker-compose
  fd
  git
  ripgrep
  rust
  vi-mode
  colored-man-pages
  zsh-syntax-highlighting
  history-substring-search
  zsh-autosuggestions
  zsh-navigation-tools
  zoxide
)

znt_list_colorpair="white/black"
znt_list_bold=1

host=$(hostname)
if [ $host = "tres.wuffs.org" ]; then
  # VPS
  export ZSH="/home/ninji/.oh-my-zsh"
elif [ $host = "fucko" ]; then
  # thinkpad Arch
  export ZSH="/home/ash/.oh-my-zsh"
elif [ $host = "egg" ]; then
  # desktop Arch
  export ZSH="/home/ash/.oh-my-zsh"
elif [ $host = "krompfty.lanx" -o $host = "trash2.local" ]; then
  # desktop Mac / laptop Mac
  export ZSH="/Users/ash/.oh-my-zsh"
  plugins=($plugins brew macos)
fi

source $ZSH/oh-my-zsh.sh




export MANPAGER="sh -c 'col -bx | bat -l man -p'"
alias grep='grep --color'
alias bg='batgrep'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| rg'
alias -g L="| bat"
alias -g LL="2>&1 | bat"
alias H='hexyl'
tree() {
	exa -TF --colour=always "$@" | bat -p
}

if [ $host = "tres.wuffs.org" ]; then
  # VPS
  export LC_ALL=en_GB.UTF-8
  source /usr/share/nvm/init-nvm.sh
elif [ $host = "fucko" ]; then
  # thinkpad Arch
  eval $(keychain --eval --quiet id_rsa)
elif [ $host = "egg" ]; then
  # desktop Arch
  eval $(keychain --eval --quiet id_ed25519)
  export PATH=/home/ash/.cargo/bin:$PATH
  export PATH=/home/ash/.dotnet/tools:$PATH
  export PATH=/home/ash/.local/bin:$PATH
  export PATH=/home/ash/.node_modules/bin:$PATH
  export npm_config_prefix=~/.node_modules
  alias ls=lsd
  export EDITOR=nvim
  alias vim=nvim
  alias gvim=nvim-qt
  brightness() {
    test -e "/sys/module/i2c_dev" || sudo modprobe i2c_dev
    ddcutil --nousb setvcp 10 "$@"
  }
  source /home/ash/.config/broot/launcher/bash/br
elif [ $host = "trash2.local" -o $host = "trash2" ]; then
  # laptop Mac
  export PATH=$PATH:/Users/ash/.cargo/bin
  export PATH=$PATH:/Users/ash/src/flutter/bin

  test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

  export EDITOR=nvim
  alias vim=nvim
  alias ls='lsd'
  source /Users/ash/.config/broot/launcher/bash/br
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export TWIB_FRONTEND=tcp
export TWIB_TCP_FRONTEND_PORT=9797

autoload -U zcalc
alias c='zcalc -#16'
