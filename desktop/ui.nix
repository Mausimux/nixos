{ pkgs, ... }: {

environment.systemPackages = with pkgs; [
	kitty
	mako
	libnotify
	rofi
	hyprshot
	hyprpolkitagent
	wl-clipboard
	cliphist
];

programs = {
	waybar = {
		enable = true;
	};
	yazi = {
		enable = true;
	};
	zoxide = {
		enable = true;
		flags = [
			"--cmd cd"
		];
	};
	direnv = {
		enable = true;
	};
};

}
