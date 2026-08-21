{ pkgs, ... }: {

environment.systemPackages = with pkgs; [
	qt6Packages.qt6ct
];

programs.dconf.profiles.user.databases = [
	{
		settings = {
			"org/gnome/desktop/interface" = {
				color-scheme = "prefer-dark";
				# gtk-theme = "Adwaita-dark";
			};
		};
	}
];

qt = {
	enable = true;
};

environment.sessionVariables.QT_QPA_PLATFORMTHEME = "qt6ct";

}
