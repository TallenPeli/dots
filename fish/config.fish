if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_add_path /home/tallen/.spicetify

alias nnn='/usr/bin/nnn -e' # -d for details and -e to open files in $VISUAL (for other options, see 'man nnn'...)

#-----
set -x NNN_OPTS H # 'H' shows the hidden files. Same as option -H (so 'nnn -deH')
# set -x NNN_OPTS "deH" # if you prefer to have all the options at the same place
set -x LC_COLLATE C # hidden files on top
set -x NNN_FIFO "/tmp/nnn.fifo" # temporary buffer for the previews
# set -x NNN_FCOLORS AAAAE631BBBBCCCCDDDD9999 # feel free to change the colors
set -x NNN_PLUG 'p:preview-tui' # many other plugins are available here: https://github.com/jarun/nnn/tree/master/plugins
set -x SPLIT v # to split Kitty vertically
#-----

function n
    if test -n "$NNNLVL" -a "$NNNLVL" -ge 1
        echo "nnn is already running"
        return
    end
    set -x NNN_TMPFILE (string join '' (or $XDG_CONFIG_HOME $HOME/.config)/nnn/.lastd)
    nnn $argv
    if test -f "$NNN_TMPFILE"
        source $NNN_TMPFILE
        rm -f $NNN_TMPFILE >/dev/null
    end
end
