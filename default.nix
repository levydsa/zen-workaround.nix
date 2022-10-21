{ nixpkgs ? (import <nixpkgs> {}), kernel ? nixpkgs.linuxPackages.kernel }:

with nixpkgs;
stdenv.mkDerivation {
  name = "zen-workaround-module";

  src = ./.;

  hardeningDisable = [ "pic" "format" ];

  nativeBuildInputs = kernel.moduleBuildDependencies;
  
  makeFlags = [
    "KERNELRELEASE=${kernel.modDirVersion}"
    "KERNEL_DIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"
    "M=$(PWD)"
    "INSTALL_MOD_PATH=$(out)"
  ];
}

