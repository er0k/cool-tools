{
  description = "cool tools for doing stuff";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      in with pkgs; {
        packages = {
          default = self.packages.${system}.stdPkgs;
          stdPkgs = pkgs.buildEnv {
            name = "tools";
            paths = [
              amazon-ecr-credential-helper
              aws-vault
              awscli2
              colima
              curl
              curlie
              direnv
              docker-client
              docker-compose
              gettext
              git
              git-lfs
              gitleaks
              gnupg
              jo
              jq
              k9s
              kubectl
              kubectx
              kubernetes-helm
              kubeseal
              kustomize
              minikube
              mtr
              nmap
              pwgen
              python313
              ripgrep
              postgresql
              shellcheck
              sipcalc
              skaffold
              sops
              terraform
              unixtools.watch
              uv
              wget
              yubikey-manager
            ];
          };
        };
      }
    );
}
