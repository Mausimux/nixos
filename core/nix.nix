{ ... }: {

nixpkgs.config.allowUnfree = true;

nix.settings.experimental-features = [
	"nix-command"
	"flakes"
];

nix.gc = {
	automatic = true;
	dates = [ "weekly" ];
	options = "--delete-older-than 14d";
};

nix.optimise = {
	automatic = true;
	dates = [ "weekly" ];
};

system.autoUpgrade = {
	enable = true;
	allowReboot = true;
	dates = "daily";
};

}
