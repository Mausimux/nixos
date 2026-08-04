{ ... }: {

programs.dconf.profiles.user.databases = [
	{
		settings = {
			"org/gnome/desktop/interface" = {
				color-scheme = "prefer-dark";
				gtk-theme = "Adwaita-dark";
			};
		};
	}
];

qt = {
	enable = true;
	style = "adwaita-dark";
};

}
