{ nixos-wsl, pkgs, ...}:
{
  nix-config.hosts.devbox-machine = {
    kind = "nixos";
    system = "x86_64-linux";

    username = "yehvaed";
    homeDirectory = "/home/yehvaed";

    nixos = {pkgs, ...}:{
       imports = [ ./configuration.nix ];

       users.users.yehvaed = {
	      shell = pkgs.zsh;
	      extraGroups = [ "wheel" ];
       };
       
       programs.zsh.enable = true;
    };

    tags = { development = true; desktop = true; };
  };
}
