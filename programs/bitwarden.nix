{ pkgs, ... }: {

environment.systemPackages = with pkgs; [
	bitwarden-desktop
];

environment.sessionVariables = {
	SSH_AUTH_SOCK = "/home/mausi/.bitwarden-ssh-agent.sock";
};

}
