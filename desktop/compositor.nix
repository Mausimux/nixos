{ inputs, pkgs, ... }: let

hyprLuaStubsSubpath = "share/hypr/stubs";

in {

nix.settings = {
	substituters = ["https://hyprland.cachix.org"];
	trusted-substituters = ["https://hyprland.cachix.org"];
	trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
};

programs.hyprland = {
	enable = true;
	package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
	portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
};

hjem.users.maxi.files.".local/${hyprLuaStubsSubpath}".source = "${pkgs.hyprland}/${hyprLuaStubsSubpath}";

services.displayManager = {
	defaultSession = "hyprland";
	sddm = {
		enable = true;
		wayland.enable = true;
	};
};

services.udev.extraRules = ''
	SUBSYSTEM=="input", ATTRS{idVendor}=="3434", ATTRS{idProduct}=="0353", ENV{ID_INPUT_JOYSTICK}="0"
'';

}
