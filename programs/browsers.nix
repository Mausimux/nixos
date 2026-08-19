{ pkgs, ... }: {

environment.systemPackages = with pkgs; [
	brave
	brave-origin
];

}
