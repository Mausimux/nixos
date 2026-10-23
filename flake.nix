{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.xdph.follows = "xdph";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    xdph = {
      url = "github:hyprwm/xdg-desktop-portal-hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.hyprland-protocols.follows = "hyprland/hyprland-protocols";
    };
    millennium = {
      url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    inputs@{ nixpkgs, ... }:
    let
      hostname = "nixos";

      lib = nixpkgs.lib;

      autoImportDiscovery =
        path:
        {
          exclude ? [ "default.nix" ],
        }:
        let

          directoryContents = builtins.readDir path;

          filtered = lib.filterAttrs (
            name: type:
            (lib.hasSuffix ".nix" name && !(builtins.elem name exclude))
            || (type == "directory" && builtins.pathExists (path + "/${name}/default.nix"))
          ) directoryContents;

          imports = lib.mapAttrsToList (name: _: path + "/${name}") filtered;

        in
        {
          inherit imports;
        };
    in
    {
      nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
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
