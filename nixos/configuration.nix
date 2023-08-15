{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.wireless.iwd.enable = true;
  networking.hostName = "shell";

  console = {
    earlySetup = true;
    font = "ter-v32n";
    packages = with pkgs; [ terminus_font ];
  };

  users.users.dayrain = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  programs = {
    git.enable = true;
    neovim = {
      enable = true;
      defaultEditor = true;
    };
    sway.enable = true;
  };

  security = {
    sudo.enable = false;
    doas = {
      enable = true;
      extraRules = [ { groups = [ "wheel" ]; persist = true; } ];
    };
  };

  environment.systemPackages = with pkgs; [
    bemenu
    (python3.withPackages(ps: with ps; [ i3ipc ]))
    telegram-desktop
    ungoogled-chromium
    wezterm
  ];

  system.stateVersion = "23.05"; # Did you read the comment?
}

