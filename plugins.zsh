# Theme
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
zinit ice depth=1
zinit light romkatv/powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Syntax Highlighting
zinit light zdharma/fast-syntax-highlighting

# Completions
zinit light zsh-users/zsh-completions
autoload -U compinit && compinit

# Completions with fzf
zinit light Aloxaf/fzf-tab

# Suggestions
zinit light zsh-users/zsh-autosuggestions

# Snippets
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::kubectl
zinit snippet OMZP::aws
zinit snippet OMZP::asdf

# History Substring Search
zinit load 'zsh-users/zsh-history-substring-search'
zinit ice wait atload'_history_substring_search_config'

# Completions cache
zinit cdreplay -q

# Vi Mode
zinit light jeffreytse/zsh-vi-mode
