{
	inputs,
	pkgs,
	...
}: {
	nix.settings = {
		substituters = ["https://hyprland.cachix.org"];
		trusted-substituters = ["https://hyprland.cachix.org"];
		trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
	};

	programs.hyprland = with inputs.hyprland.packages.${pkgs.hostPlatform.system}; {
		enable = true;
		package = hyprland;
		portalPackage = xdg-desktop-portal-hyprland;
	};

	environment.systemPackages = [
		pkgs.hyprshutdown
	];

	services.displayManager = {
		defaultSession = "hyprland";
		ly.enable = true;
	};

	services.udev.extraRules = ''
    	SUBSYSTEM=="input", ATTRS{idVendor}=="3434", ATTRS{idProduct}=="0353", ENV{ID_INPUT_JOYSTICK}="0"
  '';
}
