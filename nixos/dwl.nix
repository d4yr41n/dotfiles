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
      sha256 = "1h4f47zf4ar6jn3xya19qvbifnfssjmsk9dc9gj70slshlc9fvxx";
    })
  ];

  outputs = [ "out" "man" ];

  postPatch = let
    configFile = "${fetchurl {
      url = "https://raw.githubusercontent.com/d4yr41n/dotfiles/main/dwl/config.h";
      sha256 = "0pghmz2vkv0cxg7wav7izc6527na8icmhkgv2bazikvmdk21cv0h";
    }}";
  in "cp ${configFile} config.h";

  makeFlags = [
    "PKG_CONFIG=${stdenv.cc.targetPrefix}pkg-config"
    "WAYLAND_SCANNER=wayland-scanner"
    "PREFIX=$(out)"
    "MANDIR=$(man)/share/man"
  ];
}
