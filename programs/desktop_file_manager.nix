{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    dex
  ];

}
