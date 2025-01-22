{
  lib,
  inputs,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  home.sessionVariables = lib.mkForce {
    EDITOR = "nvim";
  };

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    clipboard.providers.wl-copy.enable = true;
    globals.mapleader = " ";
    opts = {
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      autoindent = true;
      number = true;
      relativenumber = true;
      fillchars = {eob = " ";};
      swapfile = false;
    };
    plugins = {
      alpha = {
        enable = true;
        theme = "startify";
      };
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings.sources = [
          {name = "nvim_lsp";}
          {name = "path";}
          {name = "buffer";}
        ];
        settings.mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-e>" = "cmp.mapping.close()";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
        };
      };
      lualine.enable = true;
      lsp = {
        enable = true;
        servers = {
          cssls.enable = true;
          jsonls.enable = true;
          lua_ls.enable = true;
          nixd.enable = true;
        };
      };
      nvim-tree.enable = true;
      oil.enable = true;
      telescope.enable = true;
      treesitter.enable = true;
      web-devicons.enable = true;
    };
    keymaps = [
      {
        action = "<cmd>Telescope find_files<cr>";
        key = "<leader>ff";
        mode = "n";
      }
      {
        action = "<cmd>Telescope live_grep<CR>";
        key = "<leader>fg";
        mode = "n";
      }
      {
        action = "<cmd>Telescope buffers<CR>";
        key = "<leader>fb";
        mode = "n";
      }
      {
        action = "<cmd>Telescope help_tags<CR>";
        key = "<leader>fh";
        mode = "n";
      }
      {
        action = "<cmd>NvimTreeToggle<CR>";
        key = "<C-n>";
        mode = "n";
      }
      {
        action = "<cmd>NvimTreeFocus<CR>";
        key = "<leader>e";
        mode = "n";
      }
    ];
  };
}
