{

programs.nvf.settings.vim = {
        utility = {
                oil-nvim = {
                        enable = true;
                        gitStatus.enable = true;
                };
        };
        mini = {
                icons.enable = true;
        };
        keymaps = [
                {
                        key = "<LEADER>e";
                        mode = "n";
                        action = "<CMD>Oil<CR>";
                        desc = "Open file explorer";
                }
        ];
};

}
