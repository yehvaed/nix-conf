{ pkgs, ...}:
with pkgs; [
  # go
  gopls

  # ts
  nodePackages.typescript-language-server
  
  # haskel
  ghc
  haskell-language-server
]
