inputs @ { flake-parts, nix-config-modules, ... }: 

let 
  flakeModule = {
    imports = [
      nix-config-modules.flakeModule
      ./hosts
      ./apps
    ];

    systems = [];
  };

in
  ( flake-parts.lib.mkFlake { inherit inputs;} flakeModule) //
  { inherit flakeModule; }
