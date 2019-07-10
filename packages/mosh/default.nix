{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.lib.overrideDerivation(pkgs.mosh.override {}) (attrs: rec {
  patches = attrs.patches ++ [./disable-repaint-with-ctrl-l.patch];
})
