{ lib
, stdenv
, fetchFromGitHub
, alsaLib
, autoreconfHook
, glib
, gobject-introspection
, gtk3-x11
, intltool
, librsvg
, pkg-config
, python3
, xorg
}:

stdenv.mkDerivation rec {
  pname = "sugar-toolkit-gtk3";
  version = "0.120";

  src = fetchFromGitHub {
    owner = "sugarlabs";
    repo = "sugar-toolkit-gtk3";
    rev = "v${version}";
    hash = "sha256-f3pKh0h/ZU3np4ZWTvFHp3Vgg1xEtb4Djp7ejwazCvM=";
  };

  nativeBuildInputs = [
    autoreconfHook
    intltool
    pkg-config
  ];

  buildInputs = [
    alsaLib
    glib
    gobject-introspection
    gtk3-x11
    librsvg
    python3
    xorg.libICE
    xorg.libSM
    xorg.libX11
  ];

  meta = with lib; {
    description = "Sugar Learning Environment, Activity Toolkit, GTK 3";
    homepage = "https://github.com/sugarlabs/sugar-toolkit-gtk3";
    license = licenses.lgpl21Only;
    maintainers = with maintainers; [ federicoschonborn ];
  };
}
