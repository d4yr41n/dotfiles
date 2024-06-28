{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "shell";
  networking.wireless.iwd.enable = true;

  security.sudo.enable = false;
  security.doas = {
    enable = true;
    extraRules = [{
      groups = [ "wheel" ];
      keepEnv = true;
      persist = true;
    }];
  };

  users.users.dayrain = {
    isNormalUser = true;
    extraGroups = [ "wheel" "seat" ];
    shell = pkgs.loksh;
  };

  boot.consoleLogLevel = 3;
  boot.kernelParams = [ "quiet" ];

  services.getty.autologinUser = "dayrain";
  services.seatd.enable = true;

  sound.enable = true;
    
  time.timeZone = "Etc/GMT-6";
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.systemPackages = with pkgs; [
    helix
    wl-clipboard
    alacritty
    chromium
    pyright
    clang
    pkg-config
    raylib
    wmenu
    telegram-desktop
    imv
    mpv
    grim
    swaybg
    (callPackage ./dwl.nix {})
    (callPackage ./ergo.nix {})
  ];

  fonts.packages = with pkgs; [
    fantasque-sans-mono
  ];

  system.stateVersion = "24.05";
}
