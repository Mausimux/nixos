{ pkgs, ... }: {

environment.systemPackages = with pkgs; [
	bitwarden-desktop
];

environment.sessionVariables = {
	SSH_AUTH_SOCK = "/home/maxi/.bitwarden-ssh-agent.sock";
};

}
