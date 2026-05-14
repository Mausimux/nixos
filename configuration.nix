{ config, lib, pkgs, ... }: let

currentDir = ./.;

directoryContents = builtins.readDir currentDir;

filtered = lib.filterAttrs (name: type:
	(lib.hasSuffix ".nix" name && name != "default.nix" && name != "configuration.nix")
	|| (type == "directory" && builtins.pathExists ( currentDir + "/${name}/default.nix"))
) directoryContents;

imports = lib.mapAttrsToList (name: _: currentDir + "/${name}") filtered;

in {

inherit imports;

boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;

nixpkgs.config.allowUnfree = true;

boot.kernelPackages = pkgs.linuxPackages_latest;

hardware.enableAllFirmware = true;

system.stateVersion = "25.11";

}
