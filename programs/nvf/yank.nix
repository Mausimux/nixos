{ lib, ... }: {

programs.nvf.settings.vim = {
	clipboard = {
		enable = true;
		registers = "unnamedplus";
	};
	autocmds = [
		{
			event = [ "TextYankPost" ];
			callback = lib.generators.mkLuaInline ''
				function() vim.hl.on_yank() end
			'';
		}
	];
};

}
