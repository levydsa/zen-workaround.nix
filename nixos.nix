# NixOS module

{ nixpkgs, ... }:

{
  boot.extraModulePackages = [ (nixpkgs.callPackage ./. {}) ];
  boot.kernelModules = [ "zen_workaround" ];
}

