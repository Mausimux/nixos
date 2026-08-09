{ pkgs, ... }: {

environment.systemPackages = [ pkgs.difftastic ];

programs.git = {
	enable = true;
	config = {
		diff = {
			external = "difft";
		};
		alias = {
			dshow = "show --ext-diff";
			dlog = "log -p --ext-diff";
			graph = "log --graph HEAD --branches --remotes --tags --no-show-signature --pretty=format:'%C(auto)%h%d %s %Cblue[%an, %ar]%Creset'";
			gud = "!cat ${./git_gud.txt} && pw-play ${./git_gud.mp3}";
		};
	};
};

environment.shellAliases = {
	g = "git";
	gs = "git status";
	ga = "git add";
	gr = "git restore";
	gd = "git diff HEAD";
	gc = "git commit -v";
	gp = "git push";
	gl = "git log";
	gw = "git show";
};

}
