## Automatically creates and runs a phoenix livebook container
function run_livebook () {
  docker run -p 8080:8080 --pull always -u $(id -u):$(id -g) -v $(pwd):/data livebook/livebook
}

## Convert a given text string to base64, automatically copies to clipboard
function b64() {
  echo -n "$1" | base64 -w 0 | wl-copy
}

function bb64() {
  echo -n "$1" | base64 -d
}

## Switch kubernetes contexts
function ksc() {
  contexts=$(kubectl config get-contexts -o name)
  selected_context=$(echo "${contexts}" | fzf)

  if [ -n "$selected_context" ]; then
    kubectl config use-context "$selected_context"
  else
    echo "No context selected."
  fi
}

function als() {
  local cmd=$(alias | sed "s/^alias //" | fzf --ansi --height 20 --preview "echo {}" | awk -F'=' '{print $2}' | tr -d "'")
  if [[ -n $cmd ]]; then
    eval "$cmd"
  fi
}

# Homeserver SSH Connect Machines/VMs
function conn() {
  case $1 in
    pve1)
      ssh root@10.10.10.200
      ;;
    pve2)
      ssh root@10.10.10.201
      ;;
    pve3)
      ssh root@10.10.10.202
      ;;
    vm10)
      ssh josevictor@10.10.10.210
      ;;
    vm11)
      ssh josevictor@10.10.10.211
      ;;
    vm20)
      ssh josevictor@10.10.10.220
      ;;
    vm21)
      ssh josevictor@10.10.10.221
      ;;
    vm22)
      ssh josevictor@10.10.10.222
      ;;
    vm30)
      ssh josevictor@10.10.10.230
      ;;
    vm31)
      ssh josevictor@10.10.10.231
      ;;

    *)
      echo "Invalid machine. \n Usage: conn [pve1|pve2|pve3|vm10|vm11|vm20|vm21|vm22|vm30|vm31]"
      ;;
  esac
}

