{ nixpkgs  ? import ../.
, compiler ? "default"
}:

let
  inherit (nixpkgs) pkgs;

  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  drv = haskellPackages.opencv-examples;

in if pkgs.lib.inNixShell then drv.env else drv
