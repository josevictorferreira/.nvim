let vimfolder='~/.config/nvim'
let $sourcefolder=vimfolder . '/src'

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
  source $sourcefolder/plugins.vim
call plug#end()

source $sourcefolder/functions.vim
source $sourcefolder/mappings.vim

if system('uname -s') == "Darwin\n"
  source $sourcefolder/mac-settings.vim
else
  source $sourcefolder/linux-settings.vim
endif

source $sourcefolder/settings.vim
