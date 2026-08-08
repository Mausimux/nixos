{ pkgs, ... }: let
	lsArgs = "--long --all --git --icons --no-permissions --no-user --no-time --no-filesize --ignore-glob=\".git|.direnv\"";
in {

environment.systemPackages = with pkgs; [
	eza
];

environment.shellAliases = {
	ls = "eza ${lsArgs}";
	l = "eza ${lsArgs}";
	ll = "eza ${lsArgs}";
	la = "eza ${lsArgs}";
	lt = "eza --tree ${lsArgs}";
};

}
