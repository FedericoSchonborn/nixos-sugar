{ lib
, stdenv
, fetchFromGitHub
, autoreconfHook
, python3
}:

stdenv.mkDerivation rec {
  pname = "sugar-datastore";
  version = "0.120";

  src = fetchFromGitHub {
    owner = "sugarlabs";
    repo = "sugar-datastore";
    rev = "v${version}";
    hash = "sha256-DGsURqO2EMRW0vQp+2XfiQ7p0hiArPuDQtGI2gwfw/E=";
  };

  nativeBuildInputs = [
    autoreconfHook
  ];

  buildInputs = [
    python3
  ];

  meta = with lib; {
    description = "Sugar datastore service";
    homepage = "https://github.com/sugarlabs/sugar-datastore";
    changelog = "https://github.com/sugarlabs/sugar-datastore/blob/${src.rev}/NEWS";
    license = with licenses; [ gpl2Plus ];
    maintainers = with maintainers; [ federicoschonborn ];
  };
}
