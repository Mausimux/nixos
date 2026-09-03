{

  programs.nvf.settings.vim = {
    lsp = {
      enable = true;
      formatOnSave = true;
      inlayHints.enable = true;
      lspSignature.enable = true;
      lspconfig.enable = true;
    };
    diagnostics = {
      enable = true;
      config = {
        virtual_text = true;
        signs = true;
        update_in_insert = true;
      };
    };
  };

}
