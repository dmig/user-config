# $HOME/.profile* or similar files may first set $DEBUGINFOD_URLS.
# If $DEBUGINFOD_URLS is not set there, we set it from system *.url files.
# $HOME/.*rc or similar files may then amend $DEBUGINFOD_URLS.
# See also [man debuginfod-client-config] for other environment variables
# such as $DEBUGINFOD_MAXSIZE, $DEBUGINFOD_MAXTIME, $DEBUGINFOD_PROGRESS.

if not set -q DEBUGINFOD_URLS;
    set -gx DEBUGINFOD_URLS (cat /dev/null "/etc/debuginfod"/*.urls 2>/dev/null | tr '\n' ' ')
end
