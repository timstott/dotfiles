{ pkgs ? import <nixpkgs> {}, ... }:

pkgs.writeShellScriptBin "show-path" ''
  echo $PATH | ${pkgs.gnused}/bin/sed 's/:/\n/g'
''
