function fish_right_prompt -d "Show active virtualenv"
    if set -q PYENV_VIRTUAL_ENV;
        set_color -d black;
        basename $PYENV_VIRTUAL_ENV;
        set_color normal;
    end
end
