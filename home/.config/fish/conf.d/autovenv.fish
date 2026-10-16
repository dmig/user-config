# Based on https://gist.github.com/bastibe/c0950e463ffdfdfada7adf149ae77c6f
# Changes:
# * Instead of overriding cd, we detect directory change. This allows the script to work
#   for other means of cd, such as z.
# * Update syntax to work with new versions of fish.
# * Handle virtualenvs that are not located in the root of a git directory.

function __auto_source_venv --on-variable PWD --description "Activate/Deactivate virtualenv on directory change"
    status --is-command-substitution; and return
    set gitdir (git rev-parse --show-toplevel 2>/dev/null)
    set cwd (pwd -P)

    # Check if we are inside a git directory
    if test -n "$gitdir"
        set gitdir (realpath "$gitdir")
        # If changing directory from one repository to another
        if test -n "$VIRTUAL_ENV"
            string match "$cwd*" "$VIRTUAL_ENV" >/dev/null
            if test $status -ne 0
                deactivate
            end
        end
        if test -z "$VIRTUAL_ENV"
            # While we are still inside the git directory, find the closest
            # virtualenv starting from the current directory.
            while string match "$gitdir*" "$cwd" #>/dev/null
                if test -e "$cwd/.venv/bin/activate.fish"
                    source "$cwd/.venv/bin/activate.fish" &>/dev/null
                    return
                else
                    set cwd (path dirname "$cwd")
                end
            end
        end
    end
    # If virtualenv activated but we are not in a git directory, deactivate.
    if test -n "$VIRTUAL_ENV"
        deactivate
    end
end
