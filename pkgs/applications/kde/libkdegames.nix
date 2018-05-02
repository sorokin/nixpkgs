{
  mkDerivation, lib,
  extra-cmake-modules, kdoctools,
  #qtsvg, , kcrash
  openal, libsndfile,
  qtdeclarative, kdeclarative, kdnssd, karchive,
  kcoreaddons, kwidgetsaddons, kguiaddons,
  kio, knewstuff, kcrash
}:

mkDerivation {
  name = "libkdegames";
  meta = {
    license = with lib.licenses; [ gpl2 fdl12 ];
  };
  nativeBuildInputs = [ extra-cmake-modules kdoctools ];
  buildInputs = [
    qtdeclarative kdeclarative kdnssd karchive
    kcoreaddons kwidgetsaddons kguiaddons
    kio knewstuff kcrash
    openal libsndfile
  ];
}
