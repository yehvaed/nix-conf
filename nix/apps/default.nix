{ lib, ... }:

{
  imports = [ 
    # desktop apps
    ./desktop/xmonad 
    
    # shell tools
    ./shell/nvim 
    ./shell/tmux 
    ./shell/zsh 
    ./shell/git.nix

    # rest
    ./init.nix
  ];
}
