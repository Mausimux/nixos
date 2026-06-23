{ pkgs, ... }: {

environment.systemPackages = with pkgs; [
	kitty
];

programs.tmux.enable = true;

environment.shellAliases = {
	nr = "sudo nixos-rebuild switch";
	ns = "nix shell";
};

}
