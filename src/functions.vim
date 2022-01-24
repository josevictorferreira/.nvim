function PluginExists(plugin)
  return has_key(g:plugs, a:plugin)
endfunction

function UpdateNeovim()
  echo "Updating Neovim..."
<<<<<<< Updated upstream
  silent ! cd ~/.config/nvim && git stash && git pull --rebase && git stash apply
  autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugUpdate
=======
  silent ! cd ~/.config/nvim && git stash && git pull --rebase
  :PlugInstall<CR>
  :PlugUpdate<CR>
>>>>>>> Stashed changes
endfunction
