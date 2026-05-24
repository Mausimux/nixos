{ autoImportDiscovery, ... }: autoImportDiscovery ./. { exclude = [ "default.nix" "configuration.nix" "flake.nix" ]; }
