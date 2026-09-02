{ inputs, ... }: {

imports = [ inputs.nvf.nixosModules.default ];

programs.nvf = {
        enable = true;
        defaultEditor = true;
        settings = {
                vim = {
                        viAlias = true;
                        vimAlias = true;
                        theme = {
                                enable = true;
                                name = "oxocarbon";
                                style = "dark";
                        };
                };
        };
};

environment.variables = {
    MANPAGER = "nvim +Man!";
};

}
