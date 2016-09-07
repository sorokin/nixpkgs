{ stdenv, fetchurl, cmake, SDL }:

let
  version = "0.15.0";
in

stdenv.mkDerivation {
  name = "ja2-stracciatella-${version}";

  src = fetchurl {
    url = "https://github.com/ja2-stracciatella/ja2-stracciatella/archive/v${version}.tar.gz";
    sha256 = "0pyxqfnni0hk0fbr48vz4iljmjcbayqrdgmf3khgdwj81ap2vaxq";
  };

  buildInputs = [
    SDL
  ];

  meta = with stdenv.lib; {
    description = "An improved, cross-platform, stable Jagged Alliance 2 runtime";
    license = licenses.gpl3;
  };
}
