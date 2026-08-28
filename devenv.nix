{ pkgs, lib, config, inputs, ... }:
{
    # O SQLite fica isolado apenas para este projeto
    packages = [
        pkgs.pyright
        pkgs.sqlite
        pkgs.pkg-config # new for future rust puproses
    ];

    languages.python = {
        enable = true;
        package = pkgs.python313.withPackages (p: with p; [
            # Basic python
            pip
            python-dotenv
            requests

            # Project Libs
            numpy
            pandas
            pytest
            questionary

            # JPNotebook
            ipykernel
            ipython
            nbformat
            pyqt5

            # NVIM
            jedi
            jedi-language-server
            black
            flake8
            sentinel
            python-lsp-server
            virtualenv
            pyflakes
            isort
            debugpy
            nltk
        ]);

        venv.enable = true;
        venv.requirements = ''
            apyori==1.1.2
            tensorflow
        '';
    };

    languages.rust = { # For rust
        enable = true;
        components = [
            "rustc"
            "cargo"
            "clippy"
            "rustfmt"
            "rust-analyzer"
        ];
    };


    enterShell = ''
      echo "$(python --version) — venv ativo"
      echo "$(rust --version) — toolchain rust ativa"
    '';
}
