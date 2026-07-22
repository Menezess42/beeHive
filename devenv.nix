{ pkgs, lib, config, inputs, ... }:
{
    packages = [
        pkgs.pyright
    ];
    languages.python = {
        enable = true;
        package = pkgs.python313.withPackages (p: with p; [
            kagglehub
            numpy
            scipy
            pandas
            matplotlib
            pytest
            ipykernel
            ipython
            kaggle
            plotly
            nbformat
            pyqt5
            scikit-learn
            pip

            #NVIM
            jedi
            jedi-language-server
            black
            flake8
            sentinel
            python-lsp-server
            # END NVIM

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
    enterShell = ''
      echo "$(python --version) — venv ativo"
    '';
}
