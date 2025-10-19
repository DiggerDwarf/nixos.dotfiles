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
	@echo git add .
	@echo git commit -m "update on $(DATE)
	@echo git push