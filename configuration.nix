# Welcome to the Liam NixOS config that is becoming less stock with awesomewm jammed in
{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # replace this with your hdd mount point
  boot.loader.grub.device = "/dev/nvme0n1"; # or "nodev" for efi only
  
  # Networking 
  networking.hostName = "liam-nixos"; # Define your hostname.
  networking.useDHCP = false;
  networking.interfaces.wlp2s0.useDHCP = true;
  networking.networkmanager.enable = true;


############### REPLACE FROM HERE UP WITH INFORMATION SPECIFIC TO EACH BUILD ###################


  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
 
  # power
  powerManagement.cpuFreqGovernor = "powersave";
  powerManagement.enable = true;
  powerManagement.powertop.enable = true;
  services.tlp.enable = true;
  services.thermald.enable = true; 
  
 # Splash screen
  boot.plymouth.enable = true;
  boot.plymouth.theme = "breeze";


 # Trackpad settings
  services.xserver.libinput= {
    enable = true;
    touchpad.naturalScrolling = true;
    touchpad.tapping = true;
    touchpad.tappingDragLock = false;
    touchpad.middleEmulation = true;
    touchpad.accelSpeed = "0.5";
  };


  # Graphics
  services.xserver.videoDrivers = [ "modsetting" ];
  services.xserver.useGlamor = true;
  services.xserver.deviceSection = ''Option 
    "TearFree"
    "DRI"
    "2"
    "true"'';
  programs.light.enable = true;
  hardware.nvidiaOptimus.disable = true;
 
  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  sound.mediaKeys.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.liam = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
  };

  # Enable doas instead of sudo
    security.sudo.enable = false;
    security.doas.enable = true;
    security.doas.extraRules = [{
	users = [ "liam" ];
	keepEnv = true;
        persist = true;
     }];

  # Enable AwesomeWM
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.windowManager.awesome.enable = true;
  services.picom = {
    enable = true;
    fade = true; 
    inactiveOpacity = 0.9;
    shadow = true;
    fadeDelta = 1; 
    vSync = true;
    };

  # Enable XMonad
  services.xserver.windowManager.xmonad = {
	enable = true;
	extraPackages = hpkgs: [
   	  hpkgs.xmonad
	  hpkgs.xmonad-contrib
	  hpkgs.xmonad-extras
	  ];
  };


  # Set Fish as shell
   programs.fish.enable = true;
   users.users.liam = {
   shell = pkgs.fish;
  };

  # List packages installed in system profile.
    environment.systemPackages = with pkgs; [
    wget
    vim
    spacevim
    # Window Management
    rofi
    autorandr
    dmenu
    i3lock
    pkgs.lxappearance
    polybar
    # System Applications
    pkgs.kitty
    pkgs.python39
    gotop
    pkgs.arandr
    pciutils
    brightnessctl
    # File management
    pkgs.ranger
    pkgs.gnome3.nautilus
    pkgs.gitAndTools.gitFull
    pkgs.zathura
    unzip
    feh
    # Misc
    scrot
    pfetch
  ];
     nixpkgs.config.allowUnfree = true;
 
 # Fonts
  fonts.fonts = with pkgs; [
	(nerdfonts.override {fonts = [ "Terminus" ]; })
      ];
 # Use most up to date Linux Kernals 
   # boot.kernelPackages = pkgs.linuxPackages_latest;

# NixOS Configuration 
  system.stateVersion = "20.09"; # Did you read the comment?
  #system.autoUpgrade = {
  #     enable = true;
  #     channel = https://nixos.org/channels/nixos-unstable;
  #     };
}

