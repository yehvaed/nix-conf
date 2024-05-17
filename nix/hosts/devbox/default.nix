{ nixos-wsl, pkgs, ...}:
{
  nix-config.hosts.devbox = rec {
    kind = "nixos";
    system = "x86_64-linux";

    username = "yehvaed";
    homeDirectory = "/home/yehvaed";

    nixos = {pkgs, ...}:{
       imports = [ ./configuration.nix ];

       users.users."${username}" = {
	      shell = pkgs.zsh;
	      extraGroups = [ "wheel" "audio" ];
       };

       security.sudo.extraRules = [{ 
          users = [ username ];
          commands = [{ 
            command = "ALL";
            options = [ "NOPASSWD" ];
          }];
       }];
       
       programs.zsh.enable = true;
    };

    tags = { 
      xmonad = true;
      login = true;
      terminal = true;
    };
  };
}
