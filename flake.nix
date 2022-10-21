{
  description = "AMD Zen rr workaround kernel module";
  outputs = { self }: {
    nixosModules = {
      default = import ./nixos.nix
    };
  };
}
