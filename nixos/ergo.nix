{ lib
, stdenv
, fetchgit
, pkg-config
, cairo
, pango
, wayland
, wayland-protocols
, wayland-scanner
}:

stdenv.mkDerivation rec {
  pname = "ergo";
  version = "0.0.0";

  src = fetchgit {
    url = "https://github.com/d4yr41n/ergo.git";
    hash = "sha256-PHUVrbn2AYFqr05tcPilR2jP7/alyzvpCBumlN9njHM=";
  };

  nativeBuildInputs = [ pkg-config wayland-scanner ];
  buildInputs = [ cairo pango wayland wayland-protocols ];

  outputs = [ "out" ];

  makeFlags = [
    "PREFIX=$(out)"
  ];
}

