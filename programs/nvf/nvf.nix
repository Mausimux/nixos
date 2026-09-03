{ inputs, ... }: {

  imports = [ inputs.nvf.nixosModules.default ];

  programs.nvf = {
    enable = true;
    defaultEditor = true;
    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;
      };
    };
  };

  environment.variables = {
    MANPAGER = "nvim +Man!";
  };

}
