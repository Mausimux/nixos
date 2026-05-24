{ pkgs, lib, ... }: {

fonts = {
	enableDefaultPackages = true;
	packages = with pkgs; [
		noto-fonts
		noto-fonts-color-emoji
		noto-fonts-cjk-sans
		corefonts
		vista-fonts
		inter
		jetbrains-mono
	] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
};

}
