{ stdenv
, fetchFromGitHub
, cmake
, ffmpeg
, jansson
, libxkbcommon
, qtbase
, qtx11extras
, libv4l
, x264
, curl

, pulseaudioSupport ? false
, libpulseaudio
}:

let
  optional = stdenv.lib.optional;
in stdenv.mkDerivation rec {
  name = "obs-studio-${version}";
  version = "0.13.1";

  src = fetchFromGitHub {
    owner = "jp9000";
    repo = "obs-studio";
    rev = "${version}";
    sha256 = "00dx8lksj10n0qhyar41y5q0bdrz7jdjwmhj8bdyz7jfkijjr44i";
  };

  nativeBuildInputs = [ cmake
                      ];

  buildInputs = [ curl
                  ffmpeg
                  jansson
                  libv4l
                  libxkbcommon
                  qtbase
                  qtx11extras
                  x264
                ]
                ++ optional pulseaudioSupport libpulseaudio;

  # obs attempts to dlopen libobs-opengl, it fails unless we make sure
  # DL_OPENGL is an explicit path. Not sure if there's a better way
  # to handle this.
  cmakeFlags = [ "-DCMAKE_CXX_FLAGS=-DDL_OPENGL=\\\"$(out)/lib/libobs-opengl.so\\\"" ];

  meta = with stdenv.lib; {
    description = "Free and open source software for video recording and live streaming";
    longDescription = ''
      This project is a rewrite of what was formerly known as "Open Broadcaster
      Software", software originally designed for recording and streaming live
      video content, efficiently
    '';
    homepage = "https://obsproject.com";
    maintainers = with maintainers; [ jb55 ];
    license = licenses.gpl2;
  };
}
