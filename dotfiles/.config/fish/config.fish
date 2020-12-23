# defaults
set -Ux EDITOR nvim
set -Ux VISUAL nvim

# alias
alias vim='nvim'
alias ls='lsd'
alias la='ls -a'
alias g='git'

# starship
starship init fish | source

# change start directory
cd ~