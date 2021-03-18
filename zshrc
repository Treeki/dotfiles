# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#ZSH_THEME="spaceship"
ZSH_THEME="powerlevel10k/powerlevel10k"
ZLE_RPROMPT_INDENT=0

ENABLE_CORRECTION="true"

plugins=(
  docker
  docker-compose
  fd
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
  # VPS
  export ZSH="/home/ninji/.oh-my-zsh"
elif [ $host = "fucko" ]; then
  # thinkpad Arch
  export ZSH="/home/ash/.oh-my-zsh"
elif [ $host = "egg" ]; then
  # desktop Arch
  export ZSH="/home/ash/.oh-my-zsh"
elif [ $host = "krompfty.lanx" -o $host = "trash.local" -o $host = "trash" -o $host = "trash.lan" ]; then
  # desktop Mac / laptop Mac
  export ZSH="/Users/ash/.oh-my-zsh"
  plugins=($plugins osx)
fi

source $ZSH/oh-my-zsh.sh




export MANPAGER="sh -c 'col -bx | bat -l man -p'"
alias grep='grep --color'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| bat"
alias -g LL="2>&1 | less"
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
elif [ $host = "trash.local" -o $host = "trash" ]; then
  # laptop Mac
  export THEOS=/Users/ash/theos
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  export PATH=/usr/local/opt/perl/bin:/Users/ash/.local/bin:/Users/ash/.cargo/bin:/usr/local/Caskroom/android-sdk/4333796/platform-tools/:$PATH
  export PATH=$PATH:/Users/ash/src/depot_tools
  export PATH=$PATH:/Users/ash/.emacs.d/bin

  test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
  if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
  fi

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
