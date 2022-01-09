function PluginExists(plugin)
  return has_key(g:plugs, a:plugin)
endfunction

function UpdateNeovim()
  :! cd ~/.config/nvim && git stash && git pull --rebase<CR>
  autocmd :PlugUpdate<CR>
  source $MYVIMRC
endfunction
