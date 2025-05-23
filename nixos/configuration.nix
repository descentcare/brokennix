{ config, libs, pkgs, inputs, ... }:

{
    imports =
        [ # Include the results of the hardware scan.
            ./hardware-configuration.nix
            # ./zapret.nix
        ];

    # Bootloader.
    boot.loader = {
        # systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;    
        timeout = null;
        grub = {
            enable = true;
            devices = [ "nodev" ];
            efiSupport = true;
            useOSProber = true;
        };
    };

    networking.hostName = "nixos"; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "Asia/Yekaterinburg";
    time.hardwareClockInLocalTime = true;

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "ru_RU.UTF-8";
        LC_IDENTIFICATION = "ru_RU.UTF-8";
        LC_MEASUREMENT = "ru_RU.UTF-8";
        LC_MONETARY = "ru_RU.UTF-8";
        LC_NAME = "ru_RU.UTF-8";
        LC_NUMERIC = "ru_RU.UTF-8";
        LC_PAPER = "ru_RU.UTF-8";
        LC_TELEPHONE = "ru_RU.UTF-8";
        LC_TIME = "ru_RU.UTF-8";
    };

    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Enable the KDE Plasma Desktop Environment.
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;

    programs.hyprland = {
        enable = true;
    };


    # Configure keymap in X11
    # Managed by PLASMA, so doesn't work
    services.xserver.xkb = {
        layout = "us, ru";
        variant = "";
        options = "grp:ctrl_alt_toggle";
    };

    # Enable CUPS to print documents.
    services.printing.enable = true;

# Enable sound with pipewire.
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
    };

    # Enable touchpad support (enabled default in most desktopManager).
    # services.xserver.libinput.enable = true;

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.tm = {
        isNormalUser = true;
        description = "tm";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [
    #  thunderbird
        ];
    };
    /* for unstable
    fonts.packages = with pkgs; [
        nerd-fonts.caskaydia-mono
    ];
    */

    # Install firefox.
    programs.firefox = {
        enable = true;
        nativeMessagingHosts.packages = with pkgs; [
            tridactyl-native
        ];
    # preferences = [
    # ];
    };

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages =  with pkgs; [
        wget
        vim
        xclip
        wayclip
        wofi
        waybar
        dunst
        swww
        gimp
        eww
        libnotify
    ];
    environment.variables.EDITOR = "nvim";


    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };

    # List services that you want to enable:

    # Enable the OpenSSH daemon.
    # services.openssh.enable = true;

    /* doesn't work with googlevideo.com so useless
    services.zapret = {
        enable = false;
        whitelist = [
            "youtu.be"
            "googlevideo.com"
            "*.googlevideo.com"
            "youtubei.googleapis.com"
            "ytimg.com"
            "*.ytimg.com"
            "i.ytimg.com"
            "yt3.ggpht.com"
            "yt4.ggpht.com"
            "youtube.com"
            "www.youtube.com"
            "*.youtube.com"
            "youtube"
            "youtubeembeddedplayer.googleapis.com"
            "ytimg.l.google.com"
            "jnn-pa.googleapis.com"
            "youtube-nocookie.com"
            "youtube-ui.l.google.com"
            "yt-video-upload.l.google.com"
            "wide-youtube.l.google.com"
        ];
        params = [
            "--dpi-desync=disorder2"
        ];
    };
    */

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
    system.stateVersion = "24.11"; # Did you read the comment?

}
