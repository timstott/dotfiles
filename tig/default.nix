{ pkgs, symlinkJoin, makeWrapper }:
symlinkJoin {
  name = "tig";
  buildInputs = [makeWrapper];
  paths = [ pkgs.tig ];
  tigrc = ./tigrc;
  postBuild = ''
    mkdir -p $out/share/config/tig
    cp $tigrc $out/share/config/tig/config
    wrapProgram "$out/bin/tig" \
    --set XDG_CONFIG_HOME "$out/share/config"
  '';
}
