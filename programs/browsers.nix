{ pkgs, ... }: {

environment.systemPackages = with pkgs; [
	brave-origin
];

}
