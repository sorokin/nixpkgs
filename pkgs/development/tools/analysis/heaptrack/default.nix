{ stdenv, fetchgit, cmake, qtbase, libunwind, elfutils, boost, kde5 }:

let
  version = "75a9113ea345c696cabab33517686efc0420f00a";
in

stdenv.mkDerivation {
  name = "heaptrack-git";

  src = fetchgit {
    url = "git://anongit.kde.org/heaptrack";
    rev = version;
    sha256 = "0ds3blghijcmcay6iy6gszv89f719qpc45hcd3qx9408mcv81bsg";
  };

  buildInputs = [
    cmake qtbase libunwind elfutils boost kde5.extra-cmake-modules
  ];

  meta = with stdenv.lib; {
    description = "A Heap Memory Profiler for Linux";
    license = licenses.lgpl21;
    platforms = platforms.linux;
  };
}
