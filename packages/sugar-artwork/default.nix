{ lib
, stdenv
, fetchzip
, gtk3
, iconnamingutils
, pkg-config
, python3
, xorg

, withGtk2 ? true
, gtk2
}:

stdenv.mkDerivation rec {
  pname = "sugar-artwork";
  version = "0.120";

  src = fetchzip {
    url = "https://download.sugarlabs.org/sources/sucrose/glucose/${pname}/${pname}-${version}.tar.xz";
    hash = "sha256-5o4BwXCpRCwg650BVUBzuhXlECPBWY0LsMWyYdmyrf8=";
  };

  nativeBuildInputs = [
    pkg-config
    xorg.xcursorgen
  ];

  buildInputs = [
    gtk3
    iconnamingutils
    (python3.withPackages (pp: with pp; [
      empy
    ]))
  ] ++ lib.optional withGtk2 gtk2;

  configureFlags = [
    (lib.withFeature withGtk2 "gtk2")
  ];

  meta = with lib; {
    description = "Sugar icons and themes";
    homepage = "https://github.com/sugarlabs/sugar-artwork";
    changelog = "https://github.com/sugarlabs/sugar-artwork/blob/${src.rev}/NEWS";
    license = with licenses; [ lgpl21Only asl20 ];
    maintainers = with maintainers; [ federicoschonborn ];
  };
}
