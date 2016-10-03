{ stdenv, fetchgit, cmake, python }:
stdenv.mkDerivation rec {
  name = "bear-${version}";
  version = "2.2.0";

  src = fetchgit {
    url = "git://github.com/rizsotto/Bear.git";
    rev = "b89de962c189d542e9ae2926b8fa40768b55134b";
    sha256 = "08llfqg8y6d7vfwaw5plrk1rrqzs0ywi2ldnlwvy917603971rg0";
  };

  patchPhase = ''
    patchShebangs bear/main.py.in
    patchShebangs test/end-to-end/validate_and_count.py
    patchShebangs test/exec_anatomy/json_diff.py
  '';

  buildInputs = [ python ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = "A tool that generates a compilation database for clang tooling";
    homepage = https://github.com/rizsotto/Bear;
    license = stdenv.lib.licenses.gpl3;
    maintainers = [ ];
    platforms = stdenv.lib.platforms.unix;
  };
}
