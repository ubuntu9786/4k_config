# Welcome to the Liam NixOS config that is becoming less stock with awesomewm jammed in
{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/nvme0n1"; # or "nodev" for efi only
 #Networking 
  networking.hostName = "liam-nixos"; # Define your hostname.
  networking.useDHCP = false;
  networking.interfaces.wlp2s0.useDHCP = true;
  networking.networkmanager.enable = true;
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Enable the GNOME 3 Desktop Environment and awesomewm.
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome3.enable = true;
  services.xserver.windowManager.awesome.enable = true;
  services.picom = {
    enable = true;
    fade = true; 
    inactiveOpacity = 0.8;
    shadow = true;
    fadeDelta = 1;
    vSync = true;
 };

 # Graphics
  services.xserver.videoDrivers = [ "modsetting" ];
  services.xserver.useGlamor = true;
  services.xserver.deviceSection = ''Option "TearFree" "true"'';
  programs.light.enable = true;
  hardware.nvidiaOptimus.disable = true;
 
 
 #  Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

 # Set Fish as shell
   programs.fish.enable = true;
   users.users.liam = {
   shell = pkgs.fish;
  };


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.liam = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
    environment.systemPackages = with pkgs; [
    wget vim
    rofi
    autorandr
    pkgs.neofetch
    pkgs.awesome
    pkgs.lxappearance
    pkgs.arandr
    pkgs.ubuntu_font_family
    pkgs.kitty
    pkgs.gitAndTools.gitFull
    pkgs.ranger
    pkgs.gnome3.nautilus
    dmenu
    brightnessctl
    pkgs.zathura
    pkgs.python39
    gotop
    polybar
    pywal
    scrot
    unzip
  ];
 nixpkgs.config.allowUnfree = true;
 
 # Fonts to install
  fonts.fonts = with pkgs; [
	(nerdfonts.override {fonts = [ "Terminus" ]; })
  ];

  # power
  powerManagement.cpuFreqGovernor = "powersave";
  powerManagement.enable = true;
  powerManagement.powertop.enable = true;
  services.tlp.enable = true;
  services.thermald.enable = true; 
    #services.logind.lidSwitch = "suspend";

 # Trackpad settings
  services.xserver.libinput= {
    enable = true;
    touchpad.naturalScrolling = true;
    touchpad.tapping = true;
    touchpad.tappingDragLock = false;
    touchpad.middleEmulation = true;
    touchpad.accelSpeed = "0.5";
  };
   # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?

}

