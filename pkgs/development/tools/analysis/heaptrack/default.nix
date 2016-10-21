{ stdenv, fetchgit, cmake, qt }:

let
  version = "0.18.1";
in

stdenv.mkDerivation {
  name = "qastools-${version}";

  src = fetchurl {
    url = "git://anongit.kde.org/heaptrack";
    rev = "75a9113ea345c696cabab33517686efc0420f00a";
    sha256 = "1sac6a0j1881wgpv4491b2f4jnhqkab6xyldmcg1wfqb5qkdgz12";
  };

  buildInputs = [
    cmake qt
  ];

  meta = with stdenv.lib; {
    description = "A Heap Memory Profiler for Linux";
    license = licenses.lgpl21;
    platforms = platforms.linux;
  };
}
