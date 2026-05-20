{ pkgs, ... }: let

hyprLuaStubsSubpath = "share/hypr/stubs";

in {

  programs.hyprland.enable = true;

  hjem.users.maxi.files.".local/${hyprLuaStubsSubpath}".source = "${pkgs.hyprland}/${hyprLuaStubsSubpath}";

}
