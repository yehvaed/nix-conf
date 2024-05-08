{ nixos-wsl, pkgs, ...}:
{
  nix-config.hosts.wsl = {
    kind = "nixos";
    system = "x86_64-linux";

    username = "nixos";
    homeDirectory = "/home/nixos";

    nixos = {pkgs, ...}:{
       imports = [ ./configuration.nix ];
       users.users.nixos.shell = pkgs.zsh;
       programs.zsh.enable = true;
    };

    tags = {
      development = true;
    };
  };
}
