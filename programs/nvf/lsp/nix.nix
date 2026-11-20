{
	programs.nvf.settings.vim = {
		languages.nix.enable = true;
		lsp.presets.nixd.enable = true;
		formatter.conform-nvim = {
			setupOpts.formatters.alejandra.args = [
				"--experimental-config"
				"/etc/nixos/alejandra.toml"
			];
		};
	};
}
