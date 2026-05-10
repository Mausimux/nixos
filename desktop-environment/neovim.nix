{ config, lib, pkgs, ... }:

let

nvimSrc =./nvim;
nvimDst = ".config/nvim/";

nvimFiles = builtins.filter (file:
	!(lib.strings.hasInfix "/.git/" (toString file))
) (lib.filesystem.listFilesRecursive nvimSrc);

hjemNvimUsersFiles = builtins.listToAttrs (map (file:
	let relativePath = lib.strings.removePrefix (toString nvimSrc + "/") (toString file);
	in {
		name = nvimDst + relativePath;
		value = { source = file; };
	}
) nvimFiles);

in

{

programs.neovim = {
	enable = true;
	defaultEditor = true;
	viAlias = true;
	vimAlias = true;
};

hjem.users.maxi.files = hjemNvimUsersFiles;
hjem.users.root.files = hjemNvimUsersFiles;

}
