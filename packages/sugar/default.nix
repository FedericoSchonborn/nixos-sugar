{ lib
, stdenv
, fetchFromGitHub
, autoreconfHook
, glib
, gtk3
, intltool
, pkg-config
, python3
, shared-mime-info
}:

stdenv.mkDerivation rec {
  pname = "sugar";
  version = "0.120";

  src = fetchFromGitHub {
    owner = "sugarlabs";
    repo = "sugar";
    rev = "v${version}";
    hash = "sha256-vO1xWwMBhPd2CIAtR1AFJTv6cwoT5zrHsFEdm4hUsEY=";
  };

  nativeBuildInputs = [
    autoreconfHook
    intltool
    pkg-config
    shared-mime-info
  ];

  buildInputs = [
    glib
    gtk3
    (python3.withPackages (pp: with pp; [
      empy
    ]))
  ];

  preAutoreconf = ''
    mkdir m4
  '';

  meta = with lib; {
    description = "Sugar GTK shell";
    homepage = "https://github.com/sugarlabs/sugar/";
    license = licenses.gpl2Only;
    maintainers = with maintainers; [ federicoschonborn ];
  };
}
