{ lib
, stdenv
, fetchFromGitHub
, autoreconfHook
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

  src = fetchFromGitHub {
    owner = "sugarlabs";
    repo = "sugar-artwork";
    rev = "v${version}";
    hash = "sha256-qeoppZYzLNX5VkSkqCyXVZd3OlqO6zl0EmSuebpvXtY=";
  };

  nativeBuildInputs = [
    autoreconfHook
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
