{ lib, ... }:

{
  imports = [ 
    # desktop apps
    ./guis/xmonad 
    ./guis/alacritty
    ./guis/greetd
    ./guis/rofi
    ./guis/qutebrowser

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
