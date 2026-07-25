{ pkgs, lib, config, inputs, ... }:
{
    packages = [
        pkgs.pyright
        pkgs.sqlite
    ];
    languages.python = {
        enable = true;
        package = pkgs.python313.withPackages (p: with p; [
            # Basic python
            pip
            python-dotenv

            # Project Libs
            numpy
            pandas
            pytest

            # JPNotebook
            ipykernel
            ipython
            nbformat
            pyqt5
            # END JPNotebook

            #NVIM
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
            # END NVIM
        ]);

        venv.enable = true;
        venv.requirements = ''
            apyori==1.1.2
            tensorflow
        '';
    };
    enterShell = ''
      echo "$(python --version) — venv ativo"
    '';
}
