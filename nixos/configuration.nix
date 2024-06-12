{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "shell";
  networking.wireless.iwd.enable = true;

  security.polkit.enable = true;

  users.users.dayrain = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  environment.systemPackages = with pkgs; [
    helix
    alacritty
    chromium
    python3
    pyright
    (dwl.override {
      conf = builtins.readFile "${fetchurl {
        url = "https://raw.githubusercontent.com/d4yr41n/dotfiles/main/dwl/config.h";
        sha256 = "106c16c46c75cff8d512fb4d585944ca1e510cfbf16cc5cfeb0cecb9c5aff05d";
      }}";
    })
    wmenu
    telegram-desktop
    (callPackage ./ergo.nix {})
  ];

  fonts.packages = with pkgs; [
    fantasque-sans-mono
  ];

  system.stateVersion = "24.05";
}
