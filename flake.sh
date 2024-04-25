#!/usr/bin/env bash

build() {
  echo "====> build nixos configuration"
  sudo nixos-rebuild build  --flake ".#$2"  --option eval-cache false

  echo "====> build home-manager configuration"
  home-manager build  --flake ".#$2"  --option eval-cache false
}

switch() {
  echo "====> switch nixos configuration"
  sudo nixos-rebuild switch  --flake ".#$2"  --option eval-cache false
  
  echo "====> switch home-manager configuration"
  home-manager switch  --flake ".#$2"  --option eval-cache false
}

list-hosts() {
  grep -Rh hosts hosts | cut -d"=" -f1 | tr -d " " | cut -d"." -f3
}

case $1 in

  ls) list-hosts;;
  build) build "$@";;
  switch) switch "$@";;
esac
