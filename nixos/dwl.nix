{ lib
, stdenv
, fetchgit
, fetchurl
, fetchpatch
, installShellFiles
, libinput
, libxkbcommon
, patches ? [ ]
, pixman
, pkg-config
, substituteAll
, wayland-scanner
, wayland
, wayland-protocols
, wlroots
, writeText
, conf ? null
}:

stdenv.mkDerivation rec {
  pname = "dwl";
  version = "0.5";

  src = fetchgit {
    url = "https://codeberg.org/dwl/dwl.git";
    hash = "sha256-PlzKHJZZ6I7pOZ1ubcggMMCTSQg7OLJ+8hCbKFfdyxE=";
  };

  nativeBuildInputs = [
    installShellFiles
    pkg-config
    wayland-scanner
  ];

  buildInputs = [
    libinput
    libxkbcommon
    pixman
    wayland
    wayland-protocols
    wlroots
  ];

  patches = [
    (fetchpatch {
      url = "https://raw.githubusercontent.com/d4yr41n/dotfiles/main/dwl/gaps.patch";
      hash = "sha256-IiCxAfl2Jw2k87Lv5YvKGlb5/M9ee0xdwfcE0CYjBek=";
    })
  ];

  outputs = [ "out" "man" ];

  postPatch = let
    configFile = "${fetchurl {
      url = "https://raw.githubusercontent.com/d4yr41n/dotfiles/main/dwl/config.h";
      hash = "sha256-ks7h1BZzDOi9PHYP+Umk1WZWawrLsQgcmjuhPho0ePo=";
    }}";
  in "cp ${configFile} config.h";

  makeFlags = [
    "PKG_CONFIG=${stdenv.cc.targetPrefix}pkg-config"
    "WAYLAND_SCANNER=wayland-scanner"
    "PREFIX=$(out)"
    "MANDIR=$(man)/share/man"
  ];
}
