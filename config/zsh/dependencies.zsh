# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "$ZINIT_HOME/zinit.zsh"

function install_macos_dependencies() {
  if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  if command -v fzf &> /dev/null; then
    return
  fi
  brew install fzf
}

function install_arch_dependencies() {
  # Check if fzf is already installed
  if command -v fzf &> /dev/null; then
    return
  fi
  sudo pacman -Syu --noconfirm
  sudo pacman -S --noconfirm fzf
}

function install_debian_dependencies() {
  if command -v fzf &> /dev/null; then
    return
  fi
  sudo apt update
  sudo apt install -y fzf
}

if [[ "$OSTYPE" == "darwin" ]]; then
  install_macos_dependencies
elif [[ -f /etc/arch-release ]]; then
  install_arch_dependencies
elif [[ -f /etc/debian_version ]]; then
  install_debian_dependencies
fi
