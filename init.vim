let vimplug_exists=expand('./autoload/plug.vim')

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

call plug#begin(expand('./plugged'))
  source ./plugins.vim
call plug#end()

source ./functions.vim
source ./mappings.vim

if system('uname -s') == "Darwin\n"
  source ./mac-settings.vim
else
  source ./linux-settings.vim
endif

source ./settings.vim
