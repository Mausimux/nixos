# Adding hjem for managing $HOME config files.
# Since I'm not using flakes, this is the way to get it working.
# Courtesy of choco98 - https://discord.com/channels/961691461554950145/1233827370855694426/1502331749722489123
let hjem-src = builtins.fetchTarball {
	url = "https://github.com/feel-co/hjem/archive/main.tar.gz";
	sha256 = "sha256:1kl613afzp9mi6gpf4bz2r50slg1nd0vhj4wdm9wvbhyjnz7ax8c";
};
in (import "${hjem-src}/modules/nixos/default.nix").hjem
