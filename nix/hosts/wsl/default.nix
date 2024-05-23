{ nixos-wsl, pkgs, ...}:
{
  nix-config.hosts.wsl = rec {
    kind = "nixos";
    system = "x86_64-linux";

    username = "nixos";
    homeDirectory = "/home/nixos";

    nixos = {pkgs, ...}:{
       imports = [ ./configuration.nix ];
       users.users.${username}.shell = pkgs.zsh;
       programs.zsh.enable = true;
    };

    tags = {
      development = true;
    };
  };
}
