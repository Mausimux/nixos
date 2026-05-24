{
	inputs = {
		# This is pointing to an unstable release.
		# If you prefer a stable release instead, you can change the word unstable to the latest number shown here: https://nixos.org/download
		# i.e. nixos-24.11
		# Use `nix flake update` to update the flake to the latest revision of the chosen release channel.
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		hjem = {
			url = "github:feel-co/hjem";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};
	outputs = inputs@{ self, nixpkgs, ... }: let
		hostname = "nixos";

		lib = nixpkgs.lib;

		autoImportDiscovery = path: { exclude ? [ "default.nix" ] }: let

			directoryContents = builtins.readDir path;

			filtered = lib.filterAttrs (name: type:
				(lib.hasSuffix ".nix" name && !(builtins.elem name exclude))
				|| (type == "directory" && builtins.pathExists (path + "/${name}/default.nix"))
			) directoryContents;

			imports = lib.mapAttrsToList (name: _: path + "/${name}") filtered;

		in { inherit imports; };
	in {
		# NOTE: 'nixos' is the default hostname
		nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
			specialArgs = {
				inherit hostname;
				inherit autoImportDiscovery;
			};
			modules = [
				./configuration.nix
				inputs.hjem.nixosModules.default
			];
		};
	};
}

