{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  version = "v1.11.0";
  name = "pure-zsh-prompt-${version}";

  src = fetchFromGitHub {
    owner = "sindresorhus";
    repo = "pure";
    rev = "${version}";
    sha256 = "0nzvb5iqyn3fv9z5xba850mxphxmnsiq3wxm1rclzffislm8ml1j";
  };

  installPhase = ''
    mkdir -p $out/share/zsh/site-functions/
    cp pure.zsh $out/share/zsh/site-functions/prompt_pure_setup
    cp async.zsh $out/share/zsh/site-functions/async
  '';

  dontBuild = true;
}
