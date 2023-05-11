{ lib
, stdenv
, fetchzip
, fetchpatch
, python3
}:

stdenv.mkDerivation rec {
  pname = "sugar-datastore";
  version = "0.120";

  src = fetchzip {
    url = "https://download.sugarlabs.org/sources/sucrose/glucose/${pname}/${pname}-${version}.tar.xz";
    hash = "sha256-P8b83mt7CApBH8xgSCFBr7NAIPkwlYRLslgNgTiUS0o=";
  };

  patches = [
    (fetchpatch {
      url = "https://src.fedoraproject.org/rpms/sugar-datastore/raw/rawhide/f/sugar-datastore-python-3.10-config.patch";
      hash = "sha256-CiNz/97G1XkMfaOZaClMZIHke16XVDLoStyiaFctGY0=";
    })
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
