{
  mkDerivation, lib,
  extra-cmake-modules, kdoctools,
  qtsvg, kio, kguiaddons, knewstuff, kcrash, libkdegames, qtquickcontrols2, shared_mime_info
}:

mkDerivation {
  name = "kpat";
  meta = {
    license = with lib.licenses; [ gpl2 fdl12 ];
  };
  nativeBuildInputs = [ extra-cmake-modules kdoctools ];
  buildInputs = [
    qtsvg kio kguiaddons knewstuff kcrash libkdegames qtquickcontrols2 shared_mime_info
    #baloo exiv2 kactivities kdelibs4support kio libkdcraw lcms2 libkipi phonon
    #qtimageformats qtsvg qtx11extras
  ];
}
