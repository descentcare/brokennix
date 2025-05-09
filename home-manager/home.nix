{ config, pkgs, ... }:

{
    home.username = "tm";
    home.homeDirectory = "/home/tm";

    home.packages = with pkgs; [
        viu
        mpv
        ranger
        fzf
        iotop
        iftop
        unzip
        neovim
        zig
        git
        ripgrep
        fd
        tldr
        nerdfetch
        bat
        kitty
        telegram-desktop
        yt-dlp
        youtube-tui
        brave
        btop
        neofetch
        nerdfonts
        lazygit
        zathura
        tmux
    ];

    programs.git = {
        enable = true;
        userName = "Mikhail Timofeev";
        userEmail = "descentcare@gmail.com";
    };

    home.stateVersion = "24.11";

    programs.home-manager.enable = true;
}
