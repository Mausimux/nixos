{ pkgs, lib, ... }: let

hyprLuaStubsSubpath = "share/hypr/stubs";

in {

programs.hyprland.enable = true;

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
