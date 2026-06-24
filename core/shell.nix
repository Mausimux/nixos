{ pkgs, ... }: {

environment.systemPackages = with pkgs; [
	kitty
	zellij
];

environment.shellAliases = {
	nr = "sudo nixos-rebuild switch";
	ns = "nix shell";
};

}
