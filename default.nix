{ pkgs ? import <nixpkgs> {} }:

with pkgs;

rec {
  flycheck-grammalecte = stdenv.mkDerivation {
    name = "flycheck-grammalecte";
    src = ./.;

    phases = [ "buildPhase" "installPhase" "patchPhase" ];
 
    buildInputs = [ python3Packages.grammalecte ];
    propagatedBuildInputs = [ python3Packages.grammalecte ];
    installPhase = ''
      install -d $out/share/emacs/site-lisp
      install -d $out/bin
      install $src/flycheck-grammalecte.py $out/bin
      install $src/flycheck-grammalecte.el $out/share/emacs/site-lisp
    '';
  };
}
