{
  nix-config.hosts.default = {
    kind = "nixos";
    system = "x86_64-linux";

    username = "yehvaed";
    homeDirectory = "/home/yehvaed";

    tags = { development = true; };
  };
}
