DATE = $(call date +'%Y-%M-%D/%H:%M')"

default:
	@echo "Usage: make system{/hostName}"
	@echo "            home{/userName}"
	@echo "            git"

system:
	sudo nixos-rebuild switch --flake .
system/%:
	sudo nixos-rebuild switch --flake .#$*

home:
	home-manager switch --flake .
home/%:
	home-manager switch --flake .#$*

git:
	git add .
	git commit -m "\"$$(date +'%d/%m/%y - %H:%M')\""
	git push

current:
	@echo Home manager :
	@home-manager generations | head -n 1
	@echo NixOS :
	@nix profile history --profile /nix/var/nix/profiles/system


