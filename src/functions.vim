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
  let filetype = &filetype
  if &filetype == "ruby"
    let cmd = "ruby " . filename
  elseif &filetype == "python"
    let cmd = "python " . filename
  elseif &filetype == "elixir"
    let cmd = "elixir" . filename
  elseif &filetype == "rust"
    let cmd = "cargo run --quiet"
  elseif &filetype == "sh"
    let cmd = "sh " . filename
  else
    return
  endif
  execute "tabnew | term " . cmd
endfunction
