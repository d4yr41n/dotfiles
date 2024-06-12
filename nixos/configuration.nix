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
        sha256 = "b4a482426ef952e5e624e3561470f22fabf4ed86443d9f0e13330100aee243e3";
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
