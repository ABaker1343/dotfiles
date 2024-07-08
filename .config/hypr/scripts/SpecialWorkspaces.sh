function PrintUsage {
    echo "Please give the following arguments in order: process name, window class, command, prefered_workspace"
}

function GetFocusedWindow {
    echo "$(hyprctl activewindow | grep "class" | awk '{print $2}')"
}

function GetWindowWorkspace {
    local window_class=$1
    regex="class: $window_class$"
    info="$(hyprctl clients | grep -e "$regex" -B 4)"
    workspace=$(echo "$info" | head -n 1 | awk '{print $2}')
    echo "$workspace"
}

function MoveClassToWorkspace {
    local window_class=$1
    local prefered_workspace=$2
    local current_workspace="$(GetWindowWorkspace "$window_class")"

    active_window_class="$(GetFocusedWindow)"
    windo

    # if window is focused move it to the prefered workspace
    if [ "$active_window_class" == "$window_class" ]; then
        hyprctl dispatch movetoworkspace $prefered_workspace
    else # open the windows current workspace
        hyprctl dispatch workspace $current_workspace
    fi
}

case $1 in
    "--help" | "-h")
        PrintUsage
        exit
        ;;
esac

process=$1
window_class=$2
command=$3
prefered_workspace=$4

process_pid="$(pidof $process)"
if [ -z "$process_pid" ]; then
    eval "$command" &
else
    MoveClassToWorkspace "$window_class" $prefered_workspace
fi

