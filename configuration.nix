{ lib, hostname, autoImportDiscovery, ... }:
(autoImportDiscovery ./. { exclude = [ "default.nix" "configuration.nix" "flake.nix" ]; })
// {

nixpkgs.config.allowUnfree = true;

nix.settings.experimental-features = [
	"nix-command"
	"flakes"
];

networking.hostName = hostname;

hardware.enableAllFirmware = true;

system.stateVersion = "25.11";

}
