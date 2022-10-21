# NixOS module

{ pkgs, config, ... }:

{
  boot.extraModulePackages = [
    (pkgs.callPackage ./. { nixpkgs = pkgs; kernel = config.boot.kernelPackages.kernel; })
  ];
  boot.kernelModules = [ "zen_workaround" ];
}

