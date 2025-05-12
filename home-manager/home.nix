{ config, pkgs, unstable, ... }:

{
    home.username = "tm";
    home.homeDirectory = "/home/tm";

    home.packages = with pkgs; [
        openvpn
        openvpn3
        unrar-free
        viu
        mpv
        ranger
        fzf
        iotop
        iftop
        unzip
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
        # cargo
        # rustc

        dotnet-sdk
        dotnet-aspnetcore
        dotnet-runtime
    ];

    programs.neovim = {
        enable = true;
        extraPackages = with pkgs; [
            lua-language-server
            nixd
            roslyn-ls
        ];
    };

    programs.git = {
        enable = true;
        userName = "Mikhail Timofeev";
        userEmail = "descentcare@gmail.com";
    };

    home.stateVersion = "24.11";

    programs.home-manager.enable = true;
}
