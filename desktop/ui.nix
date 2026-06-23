{ pkgs, ... }: {

environment.systemPackages = with pkgs; [
	mako
	libnotify
	rofi
	hyprshot
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
