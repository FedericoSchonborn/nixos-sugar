{ lib
, stdenv
, fetchzip
, alsaLib
, gobject-introspection
, gtk3
, intltool
, librsvg
, pkg-config
, python3
}:

stdenv.mkDerivation rec {
  pname = "sugar-toolkit-gtk3";
  version = "0.120";

  src = fetchzip {
    url = "https://download.sugarlabs.org/sources/sucrose/glucose/${pname}/${pname}-${version}.tar.xz";
    hash = "sha256-3svYzr5mmp532OISBAUXLd904tnvHvWoi1W3jAJeZCA=";
  };

  nativeBuildInputs = [
    intltool
    pkg-config
  ];

  buildInputs = [
    alsaLib
    gobject-introspection
    gtk3
    librsvg
    python3
  ];

  meta = with lib; {
    description = "Sugar Learning Environment, Activity Toolkit, GTK 3";
    homepage = "https://github.com/sugarlabs/sugar-toolkit-gtk3";
    license = licenses.lgpl21Only;
    maintainers = with maintainers; [ federicoschonborn ];
  };
}
