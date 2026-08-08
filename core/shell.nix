{ pkgs, ... }: let
	lsArgs = "--long --all --git --icons --no-permissions --no-user --no-time --no-filesize --ignore-glob=\".git|.direnv\"";
in {

environment.systemPackages = with pkgs; [
	kitty
	zellij
	eza
];

environment.shellAliases = {
	nr = "sudo nixos-rebuild switch";
	ns = "nix shell";

	ls = "eza ${lsArgs}";
	l = "eza ${lsArgs}";
	ll = "eza ${lsArgs}";
	la = "eza ${lsArgs}";
	lt = "eza --tree ${lsArgs}";
};

}
