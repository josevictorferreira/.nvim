function PluginExists(plugin)
  return has_key(g:plugs, a:plugin)
endfunction

function UpdateNeovim()
  echo "Updating Neovim..."
  silent ! cd ~/.config/nvim && git stash && git pull --rebase
  autocmd VimEnter * PlugUpdate
	autocmd VimEnter * UpdateRemotePlugins
endfunction
