{ lib
, stdenv
, fetchzip
, gtk3
, intltool
, pkg-config
, python3
, shared-mime-info
}:

stdenv.mkDerivation rec {
  pname = "sugar";
  version = "0.120";

  src = fetchzip {
    url = "https://download.sugarlabs.org/sources/sucrose/glucose/${pname}/${pname}-${version}.tar.xz";
    hash = "sha256-aAzGq78KyeVWa4WO2wx3UwK9PKc86W041ukTXTRawFE=";
  };

  nativeBuildInputs = [
    intltool
    pkg-config
    shared-mime-info
  ];

  buildInputs = [
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
