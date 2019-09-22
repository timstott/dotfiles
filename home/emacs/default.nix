{ pkgs, ... }:

let
  emacsPackage = pkgs.emacs;
  emacsWithPackages = (pkgs.emacsPackagesNgGen emacsPackage).emacsWithPackages;

  emacs = emacsWithPackages (epkgs: (
    with epkgs.melpaStablePackages; [
      evil
      evil-leader
      evil-surround
      counsel
      counsel-projectile
      solarized-theme
    ]) ++ (with epkgs.melpaPackages; [
      magit
    ]) ++ (with epkgs.orgPackages; [
      org
    ])
  );
in
{
  home.packages = [
    emacs
  ];
}
