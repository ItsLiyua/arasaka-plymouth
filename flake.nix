{
  description = "Flake for Pascal Schwietzer's Package for the Arasaka Plymouth Theme";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      sys:
      let
        pkgs = nixpkgs.legacyPackages.${sys};
      in
      {
        packages.default = pkgs.stdenv.mkDerivation {
          pname = "plymouth-arasaka-theme";
          version = "1.0";

          src = nixpkgs.lib.fileset.toSource {
            root = ./.;
            fileset = ./.;
          };

          # dontConfigure = true;
          # dontBuild = true;

          installPhase = ''
            		runHook preInstall

            		mkdir -p $out/share/plymouth/themes/arasaka/
                cp -r $src/* $src/.* $out/share/plymouth/themes/arasaka/
            		substituteInPlace $out/share/plymouth/themes/arasaka/*.plymouth --replace '@ROOT@' "$out/share/plymouth/themes/arasaka/"

            		runHook postInstall
            	'';
        };
      }
    );
}
