#--- vim configuration / home-manager
{ config, lib, pkgs, modulesPath, ... }:
{
  #--- vim configuration
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      # -- colorscheme
      awesome-vim-colorschemes vim-airline vim-airline-themes
      # -- the best of the rest
      fzf-vim goyo markdown-preview-nvim limelight-vim vim-nix
      vim-startify vim-snippets vim-vinegar vim-fugitive ultisnips
    ];
    #--- settings
    settings = {
      number = true;
      relativenumber  = false;
      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;
    };
    extraConfig  = ''
      """""""""""""""""""""""""""""""""""""""""""""""""""""
      " declared by configuration.nix / slm
      "
      source $XDG_CONFIG_HOME/vim/settings.vim
      source $XDG_CONFIG_HOME/vim/maps.vim
      "
      """""""""""""""""""""""""""""""""""""""""""""""""""""
   '';
  };
}
