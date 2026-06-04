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
	hyprsunset
];

programs = {
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
