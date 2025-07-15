{
  description = "KCL Postgraduate LaTeX Doc";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    systems.url = "github:nix-systems/default";
  };

  outputs = {
    self,
    nixpkgs,
    systems,
    ...
  }: let
    forAllSystems = f:
      nixpkgs.lib.genAttrs (import systems) (system: f nixpkgs.legacyPackages.${system});

    name = "report.pdf";

    latex-pkgs = forAllSystems (
      pkgs: [
        (
          pkgs.texliveBasic.withPackages (
            ps:
              with ps; [
                # Tooling
                latexmk
                chktex
                latexindent
                texcount
                biblatex
                biblatex-ieee
                biber
                microtype
                setspace
                # Should have
                svg
                xcolor
                transparent
                pgf
                catchfile
                csquotes
                amsmath
                amsfonts
                collection-fontsrecommended
                # Nice to have
                tcolorbox
                pgfgantt
                pgfplots
                caption
                glossaries
                glossaries-english
                glossaries-extra
                # standalone
                standalone
                filehook
                svn-prov
                # booktabs
                booktabs
                multirow
                # violin plots
                tikzviolinplots
                stringstrings
              ]
          )
        )
        pkgs.inkscape
      ]
    );
  in {
    devShells = forAllSystems (pkgs: {
      default = pkgs.mkShellNoCC {
        packages = [
          latex-pkgs.${pkgs.system}
          pkgs.zathura
          pkgs.texlab
        ];
      };
    });

    packages = forAllSystems (pkgs: {
      default = pkgs.stdenvNoCC.mkDerivation {
        inherit name;
        src = self;
        nativeBuildInputs = [
          latex-pkgs.${pkgs.system}
        ];
        TEXMFHOME = ".cache";
        TEXMFVAR = ".cache/texmf-var";

        buildPhase = ''
          runHook preBuild

          mkdir -p .cache/texmf-var
          latexmk -pdf

          runHook postBuild
        '';

        installPhase = ''
          runHook preInstall

          mkdir -p $out
          cp ${name} $out/

          runHook postInstall
        '';
      };
    });
  };
}
