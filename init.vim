let vimfolder='~/.config/nvim'

let vimplug_exists=expand(vimfolder . '/autoload/plug.vim')

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-lug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ./autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
  source $MYVIMRC
endif

call plug#begin(expand(vimfolder . '/plugged'))
  source ~/.config/nvim/plugins.vim
call plug#end()

source ~/.config/nvim/functions.vim
source ~/.config/nvim/mappings.vim

if system('uname -s') == "Darwin\n"
  source ~/.config/nvim/mac-settings.vim
else
  source ~/.config/nvim/linux-settings.vim
endif

source ~/.config/nvim/settings.vim
