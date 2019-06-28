{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  version = "37fc76d8a74b98a9fbcc697ca7efd600e669311e";
  name = "pure-zsh-prompt-${version}";

  patches = [ ./pure-prompt-color.diff ];

  src = fetchFromGitHub {
    owner = "sindresorhus";
    repo = "pure";
    rev = "${version}";
    sha256 = "0j1pqncvwa1f9s5vwv526y3rhfzpvi04pywwdj0ndrwh8s86zi47";
  };

  installPhase = ''
    mkdir -p $out/share/zsh/site-functions/
    cp pure.zsh $out/share/zsh/site-functions/prompt_pure_setup
    cp async.zsh $out/share/zsh/site-functions/async
  '';

  dontBuild = true;
}
