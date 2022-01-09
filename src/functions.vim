function PluginExists(plugin)
  return has_key(g:plugs, a:plugin)
endfunction

function UpdateNeovim()
  echo "Updating Neovim..."
  :! cd ~/.config/nvim && git stash && git pull --rebase<CR>
  autocmd VimEnter * PlugUpdate
  source $MYVIMRC
	autocmd VimEnter * UpdateRemotePlugins
endfunction
