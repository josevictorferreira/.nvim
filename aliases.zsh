WORKSPACE="$HOME/Workspace"
SHARED_FOLDER="$HOME/shared_storage"
NOTETAKING_FOLDER="$SHARED_FOLDER/notetaking"
AGROSMART_FOLDER="~/Workspace/agrosmart"
BOOSTER_AGRO_FOLDER="$AGROSMART_FOLDER/booster/"

# Sudo using environment config
alias sudo='sudo -E '
alias s='sudo -E '

# General Applications
alias k=kubectl
alias v=nvim
alias d=docker
alias be="bundle exec "
alias ber="bundle exec rspec "
alias m="make "

alias ls='eza -a --icons'
alias ll='eza -al --icons'
alias lt='eza -a --tree --level=1 --icons'

alias rtmux="tmux source-file ~/.config/tmux/tmux.conf"

# Personal
alias wspc="cd $WORKSPACE"
alias ideas="nvim $NOTETAKING_FOLDER/ideas/Ideas.md"
alias todo="nvim $NOTETAKING_FOLDER/checklists/Todo.md"
alias notes="nvim $NOTETAKING_FOLDER/notes/Notes.md"
alias prompts="nvim $NOTETAKING_FOLDER/notes/Prompts.md"
alias sht="nvim $NOTETAKING_FOLDER/notes/CheatSheets.md"
alias sheet="nvim $NOTETAKING_FOLDER/notes/CheatSheets.md"

alias plan="nvim $WORKSPACE/plan.md"
alias buy="nvim $WORKSPACE/buy.md"
alias zshrc="nvim $HOME/.config/zsh/init.zsh"
alias aliases="nvim $HOME/.config/zsh/aliases.zsh"
alias exer="cd $WORKSPACE/exercism"
alias readm="cd $WORKSPACE/readmore-project"
alias ebook="cd $WORKSPACE/ebookit"
alias ebookit="cd $WORKSPACE/ebookit/ebookit-extension"
alias rinha="cd $WORKSPACE/rinha-backend"
alias hl="cd $WORKSPACE/homelab"
alias vista="cd $WORKSPACE/vista-valor"
alias real="cd $WORKSPACE/realiza-monorepo"
alias nix-shell='nix-shell --run zsh'

# K8s
alias prod="k9s -n production -c pods"
alias stag="k9s -n staging -c pods"

alias set_mini="kubectl config use-context minikube && \
  kubectl config set-context minikube"

alias shared="cd $SHARED_FOLDER"

# Work
alias agro="cd $AGROSMART_FOLDER"

alias nex="cd $AGROSMART_FOLDER/nexus/nexus-backend"

alias farm="cd $BOOSTER_AGRO_FOLDER/farm-service"
alias acc="cd $BOOSTER_AGRO_FOLDER/account-service"
alias field="cd $BOOSTER_AGRO_FOLDER/booster-field-notebook-service"
alias sat="cd $BOOSTER_AGRO_FOLDER/satellite-image-service"
alias geo="cd $BOOSTER_AGRO_FOLDER/georef-measures-service"
alias map="cd $BOOSTER_AGRO_FOLDER/weather-map-service"
alias weat="cd $BOOSTER_AGRO_FOLDER/weather-forecast-service"
alias inf="cd $BOOSTER_AGRO_FOLDER/booster-infra"
alias kong="cd $BOOSTER_AGRO_FOLDER/kong-api-gateway"

alias nexapi="cd $AGROSMART_FOLDER/nexus-api-gateway"

alias key="cd $BOOSTER_AGRO_FOLDER/keycloak"
