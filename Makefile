.DEFAULT_GOAL := help

secrets: ## Edit the secrets file
	sops secrets/secrets.enc.yaml

rebuild: ## Rebuild NixOS configuration.
	@if [ "$(shell uname)" = "Darwin"]; then \
		darwin-rebuild switch --flake .#josevictorferreira-macos --impure; \
	else \
		nixos-rebuild switch --flake .#josevictor-nixos --impure; \
	fi

help: ## Show this help.
	@printf "Usage: make [target]\n\nTARGETS:\n"; grep -F "##" $(MAKEFILE_LIST) | grep -Fv "grep -F" | grep -Fv "printf " | sed -e 's/\\$$//' | sed -e 's/##//' | column -t -s ":" | sed -e 's/^/    /'; printf "\n"
