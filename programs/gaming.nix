{ inputs, pkgs, ... }: {

nixpkgs.overlays = [ inputs.millennium.overlays.default ];

programs.steam = {
	enable = true;
	package = pkgs.millennium-steam;
	extraCompatPackages = with pkgs; [
		proton-ge-bin
	];
};

environment.systemPackages = with pkgs; [
	mangohud
	prismlauncher
];

}
