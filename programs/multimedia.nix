{ pkgs, ... }: {

environment.systemPackages = with pkgs; [
	qbittorrent
	(mpv.override { youtubeSupport = false; })
	syncplay
];

programs.obs-studio = {
	enable = true;
};

}
