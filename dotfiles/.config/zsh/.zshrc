# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# load zgen
source "$HOME/.local/bin/zgen/zgen.zsh"

# plugins
zgen load zsh-users/zsh-completions src
zgen load zdharma/fast-syntax-highlighting
zgen load romkatv/powerlevel10k powerlevel10k
zgen save

setopt promptsubst
setopt autocd

#tab completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# defaults
export EDITOR='nvim'
export VISUAL='nvim'

# alias
alias vim='nvim'
alias ls='lsd'
alias la='ls -a'
alias g='git'
alias cat='bat'
alias volume='pactl set-sink-volume alsa_output.pci-0000_08_00.3.iec958-stereo'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.config/zsh/p10k.zsh ]] || source ~/.config/zsh/p10k.zsh
