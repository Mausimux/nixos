{ ... }:

{

programs.neovim = {
	enable = true;
	defaultEditor = true;
	viAlias = true;
	vimAlias = true;
};

programs.nix-ld.enable = true; # Something about neovim mason/lsp plugins not working

hjem.users.root.files.".config/nvim".source = "/home/maxi/.config/nvim";
hjem.users.root.files.".local/share/nvim".source = "/home/maxi/.local/share/nvim";

}
