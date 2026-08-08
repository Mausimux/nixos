{ ... }: {

environment.shellAliases = {
	rebuild = "sudo nixos-rebuild switch";
	shell = "nix shell";
};

}
