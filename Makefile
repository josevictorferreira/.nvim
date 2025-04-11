.DEFAULT_GOAL := help

secrets: ## Edit the secrets file
	sops secrets/secrets.enc.yaml

rebuild: ## Rebuild NixOS configuration.
	sudo nixos-rebuild switch --flake .#josevictor-nixos --impure

help: ## Show this help.
	@printf "Usage: make [target]\n\nTARGETS:\n"; grep -F "##" $(MAKEFILE_LIST) | grep -Fv "grep -F" | grep -Fv "printf " | sed -e 's/\\$$//' | sed -e 's/##//' | column -t -s ":" | sed -e 's/^/    /'; printf "\n"
