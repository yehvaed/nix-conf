{ lib, ... }:

{
  imports = [ 
    # desktop apps
    ./guis/xmonad 
    ./guis/alacritty
    ./guis/greetd

    # shell tools
    ./tools/nvim 
    ./tools/tmux 
    ./tools/zsh 
    ./tools/git.nix

    # rest
    ./fonts.nix
    ./init.nix
  ];
}
