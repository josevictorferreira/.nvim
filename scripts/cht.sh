#!/bin/bash

BASE_URL="http://cht.sh"

Languages=('elixir' 'ruby' 'rust' 'bash' 'lua' 'python' 'crystal' 'go')
Tools=('tmux' 'docker' '7z' 'docker-compose' 'curl' 'kubectl' 'git')
Coreutils=('xargs' 'sed' 'awk' 'grep' 'ifconfig')

get_options () {
  printf "%s\n%s\n%s\n" "${Languages[@]}" "${Tools[@]}" "${Coreutils[@]}"
}

retrieve_sheet () {
  option="$1"
  query="$2"
  if [[ "${Languages[*]}" =~ ${option} ]]; then
    if [[ $query == "" ]]; then
      tmux neww bash -c "curl "$BASE_URL/$option/:learn" & while [ : ]; do sleep 1; done"
    else
      tmux neww bash -c "curl "$BASE_URL/$option/$(echo "$query" | tr ' ' '+')" & while [ : ]; do sleep 1; done"
    fi
  elif [[ "${Tools[*]}" =~ ${option} ]]; then
    tmux neww bash -c "curl "$BASE_URL/$option" & while [ : ]; do sleep 1; done"
  elif [[ "${Coreutils[*]}" =~ ${option} ]]; then
    if [[ $query == "" ]]; then
      tmux neww bash -c "curl "$BASE_URL/$option/:learn" & while [ : ]; do sleep 1; done"
    else
      tmux neww bash -c "curl "$BASE_URL/$option~$query" & while [ : ]; do sleep 1; done"
    fi
  fi
}

main () {
  selected_value=$(get_options | fzf)
  read -rp "Query: " query
  retrieve_sheet "$selected_value" "$query"
}

main "$@"
