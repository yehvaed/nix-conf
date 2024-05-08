inputs @ { flake-parts, nix-config-modules, nixos-wsl, ... }: 

let 
  flakeModule = {
    imports = [
      nix-config-modules.flakeModule
      ./hosts
      ./apps
   ];
    
    systems = [];


   nix-config.modules.nixos = [
   	nixos-wsl.nixosModules.wsl
   ];
  };

in
  ( flake-parts.lib.mkFlake { inherit inputs;} flakeModule) //
  { inherit flakeModule; }
