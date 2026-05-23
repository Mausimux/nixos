{ lib, ... }: let

currentDir = ./.;

directoryContents = builtins.readDir currentDir;

filtered = lib.filterAttrs (name: type:
	(lib.hasSuffix ".nix" name && name != "default.nix" && name != "configuration.nix" && name != "flake.nix")
	|| (type == "directory" && builtins.pathExists ( currentDir + "/${name}/default.nix"))
) directoryContents;

imports = lib.mapAttrsToList (name: _: currentDir + "/${name}") filtered;

in {

inherit imports;

nixpkgs.config.allowUnfree = true;

nix.settings.experimental-features = [
	"nix-command"
	"flakes"
];

hardware.enableAllFirmware = true;

system.stateVersion = "25.11";

}
