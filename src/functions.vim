function PluginExists(plugin)
  return has_key(g:plugs, a:plugin)
endfunction

function UpdateNeovim()
  echo "Updating Neovim..."
  silent ! cd ~/.config/nvim && git stash && git pull --rebase && git stash apply
  autocmd VimEnter * PlugInstall
endfunction

function RunCode()
  let filename = @%
  execute "new | term ruby ". filename . ""
endfunction
