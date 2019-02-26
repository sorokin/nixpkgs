{ stdenv, fetchgit, fuse, libmtp }:

stdenv.mkDerivation rec {
  name = "simple-mtpfs-0.3";

  buildInputs = [ fuse libmtp ];

  src = fetchgit {
    url = "https://github.com/sorokin/simple-mtpfs.git";
    rev = "43604c0a0811da414774af16adb45a2d6bb81483";
    sha256 = "10i079h79l4gdch1qy2vrrb2xxxkgkjmgphr129a75jbbagwvz0k";
  };

  meta = {
    homepage = https://github.com/sorokin/simple-mtpfs;
    description = "FUSE Filesystem providing access to MTP devices";
    platforms = stdenv.lib.platforms.all;
    maintainers = [ ];
  };
}
