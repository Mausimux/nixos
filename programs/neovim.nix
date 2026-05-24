{ pkgs, ... }: {

programs.neovim = {
	enable = true;
	defaultEditor = true;
	viAlias = true;
	vimAlias = true;
};

environment.systemPackages = with pkgs; [
	ripgrep
	fd
];

programs.nix-ld.enable = true;

hjem.users.root.files.".config/nvim".source = "/home/maxi/.config/nvim";
hjem.users.root.files.".local/share/nvim".source = "/home/maxi/.local/share/nvim";

}
