{ isMaximal ? false }:
{
  vim = {
    viAlias = true;
    vimAlias = true;

    debugMode = {
      enable = false;
      level = 16;
      logFile = "/tmp/nvim.log";
    };

    spellcheck.enable = false;

    lsp = {
      enable = true;
      formatOnSave = false;
      lspkind.enable = false;
      lightbulb.enable = true;
      lspsaga.enable = false;
      trouble.enable = true;
      lspSignature.enable = !isMaximal;
      otter-nvim.enable = isMaximal;
      nvim-docs-view.enable = isMaximal;
    };

    debugger.nvim-dap = {
      enable = true;
      ui.enable = true;
    };

    languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;
      nix.enable = true;
      markdown.enable = true;
      assembly.enable = false;
      astro.enable = false;
      nu.enable = false;
      csharp.enable = false;
      julia.enable = false;
      vala.enable = false;
      scala.enable = false;
      r.enable = false;
      gleam.enable = false;
      dart.enable = false;
      ocaml.enable = false;
      elixir.enable = false;
      haskell.enable = false;
      ruby.enable = false;
      fsharp.enable = false;
      tailwind.enable = false;
      svelte.enable = false;
      nim.enable = false;
    };

    visuals = {
      nvim-scrollbar.enable = isMaximal;
      nvim-web-devicons.enable = true;
      nvim-cursorline.enable = true;
      cinnamon-nvim.enable = true;
      fidget-nvim.enable = true;
      highlight-undo.enable = true;
      indent-blankline.enable = true;
      cellular-automaton.enable = false;
    };

    statusline.lualine = {
      enable = true;
      theme = "auto";
    };

    theme = {
      enable = true;
      transparent = true;
      name = "base16";
      style = "ashes";
      base16-colors = {
        base00 = "#161616";
        base01 = "#262626";
        base02 = "#393939";
        base03 = "#525252";
        base04 = "#dde1e6";
        base05 = "#f2f4f8";
        base06 = "#ffffff";
        base07 = "#08bdba";
        base08 = "#3ddbd9";
        base09 = "#78a9ff";
        base0A = "#ee5396";
        base0B = "#33b1ff";
        base0C = "#ff7eb6";
        base0D = "#42be65";
        base0E = "#be95ff";
        base0F = "#82cfff";
      };
    };

    autopairs.nvim-autopairs.enable = true;

    autocomplete = {
      nvim-cmp.enable = !isMaximal;
      blink-cmp.enable = isMaximal;
    };

    snippets.luasnip.enable = true;
    filetree.neo-tree.enable = false;
    tabline.nvimBufferline.enable = false;
    treesitter.context.enable = true;

    binds = {
      whichKey.enable = true;
      cheatsheet.enable = true;
    };

    telescope.enable = true;

    git = {
      enable = true;
      gitsigns.enable = true;
      gitsigns.codeActions.enable = false;
      neogit.enable = isMaximal;
    };

    minimap = {
      minimap-vim.enable = false;
      codewindow.enable = isMaximal;
    };

    dashboard = {
      dashboard-nvim.enable = false;
      alpha.enable = false;
    };

    notify.nvim-notify.enable = true;
    projects.project-nvim.enable = isMaximal;

    utility = {
      ccc.enable = false;
      vim-wakatime.enable = false;
      diffview-nvim.enable = true;
      yanky-nvim.enable = false;
      oil-nvim.enable = true;
      icon-picker.enable = isMaximal;
      surround.enable = true;
      leetcode-nvim.enable = isMaximal;
      multicursors.enable = isMaximal;
      smart-splits.enable = isMaximal;
      undotree.enable = isMaximal;
      nvim-biscuits.enable = isMaximal;
      motion = {
        hop.enable = true;
        leap.enable = true;
        precognition.enable = isMaximal;
      };
      images = {
        image-nvim.enable = false;
        img-clip.enable = isMaximal;
      };
      preview.markdownPreview.enable = true;
    };

    notes = {
      obsidian.enable = false;
      neorg.enable = false;
      orgmode.enable = false;
      todo-comments.enable = true;
    };

    terminal.toggleterm = {
      enable = true;
      lazygit.enable = true;
    };

    ui = {
      borders.enable = true;
      noice.enable = true;
      colorizer.enable = true;
      modes-nvim.enable = false;
      illuminate.enable = true;
      breadcrumbs = {
        enable = isMaximal;
        navbuddy.enable = isMaximal;
      };
      smartcolumn = {
        enable = false;
        setupOpts.custom_colorcolumn = {
          nix = "110";
          ruby = "120";
          java = "130";
          go = [ "90" "130" ];
        };
      };
      fastaction.enable = true;
    };

    assistant = {
      chatgpt.enable = false;
      copilot = {
        enable = false;
        cmp.enable = isMaximal;
      };
      codecompanion-nvim.enable = false;
      avante-nvim.enable = isMaximal;
    };

    session.nvim-session-manager.enable = false;
    gestures.gesture-nvim.enable = false;
    comments.comment-nvim.enable = true;
    presence.neocord.enable = false;

    keymaps = [
      { key = "<leader>bd";    mode = [ "n" ]; action = "<cmd>bdelete<cr>";                    silent = false; desc = "bdelete"; }
      { key = "<leader>q";     mode = [ "n" ]; action = "<cmd>quit<cr>";                       silent = false; desc = "quit"; }
      { key = "<leader>c";     mode = [ "n" ]; action = "<cmd>close<cr>";                      silent = false; desc = "close window"; }
      { key = "<leader>o";     mode = [ "n" ]; action = "<cmd>only<cr>";                       silent = false; desc = "only"; }
      { key = "<leader>qa";    mode = [ "n" ]; action = "<cmd>quitall<cr>";                    silent = false; desc = "quitall"; }
      { key = "<leader>cc";    mode = [ "n" ]; action = "<cmd>Telescope command_history<cr>";  silent = false; desc = "telescope command history"; }
      { key = "<leader>f";     mode = [ "n" ]; action = "<cmd>Telescope find_files<cr>";       silent = false; desc = "telescope find files"; }
      { key = "<leader>h";     mode = [ "n" ]; action = "<cmd>Telescope help_tags<cr>";        silent = false; desc = "telescope help tags"; }
      { key = "<leader><space>"; mode = [ "n" ]; action = "<cmd>Telescope buffers<cr>";        silent = false; desc = "telescope buffers"; }
      { key = "<leader>m";     mode = [ "n" ]; action = "<cmd>MarkdownPreview<cr>";            silent = false; desc = "MarkdownPreview"; }
      { key = "<C-h>"; mode = [ "n" ]; action = ":wincmd h<cr>"; silent = true; desc = "wincmd h"; }
      { key = "<C-j>"; mode = [ "n" ]; action = ":wincmd j<cr>"; silent = true; desc = "wincmd j"; }
      { key = "<C-k>"; mode = [ "n" ]; action = ":wincmd k<cr>"; silent = true; desc = "wincmd k"; }
      { key = "<C-l>"; mode = [ "n" ]; action = ":wincmd l<cr>"; silent = true; desc = "wincmd l"; }
      { key = "<C-v>"; mode = [ "n" ]; action = ":wincmd v<cr>"; silent = true; desc = "wincmd v"; }
    ];
  };
}
