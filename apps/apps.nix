{ pkgs, ... }:

{

environment.systemPackages = with pkgs; [
	brave
	discord
	qbittorrent
	(mpv.override { youtubeSupport = false; })
	syncplay
];

programs = {
	obs-studio = {
		enable = true;
	};
};

}
