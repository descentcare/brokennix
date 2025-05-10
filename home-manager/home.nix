{ config, pkgs, ... }:

{
    home.username = "tm";
    home.homeDirectory = "/home/tm";

    home.packages = with pkgs; [
        ranger
        fzf
        iotop
        iftop
    ];

    programs.git = {
        enable = true;
        userName = "Mikhail Timofeev";
        userEmail = "descentcare@gmail.com";
    };

    home.stateVersion = "24.11";

    programs.home-manager.enable = true;
}
