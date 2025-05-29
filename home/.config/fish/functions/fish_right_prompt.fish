function fish_right_prompt -d "Show active virtualenv"
    if set -q VIRTUAL_ENV
        set_color -d grey
        basename $VIRTUAL_ENV
        set_color normal
    end
end
