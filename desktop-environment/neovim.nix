{ config, lib, pkgs, ... }:

{

programs.neovim = {
	enable = true;
	defaultEditor = true;
	viAlias = true;
	vimAlias = true;
};

hjem.users.root.files.".config/nvim".source = "/home/maxi/.config/nvim";
hjem.users.root.files.".local/share/nvim".source = "/home/maxi/.local/share/nvim";

}
