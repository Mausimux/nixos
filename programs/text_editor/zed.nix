{ inputs, pkgs, ... }: {

nix.settings = {
	substituters = [ "https://zed.cachix.org" ];
	trusted-public-keys = [ "zed.cachix.org-1:/pHQ6dpMsAZk2DiP4WCL0p9YDNKWj2Q5FL20bNmw1cU=" ];
};

environment.systemPackages = [
	inputs.zed.packages.${pkgs.stdenv.hostPlatform.system}.default
];

}
