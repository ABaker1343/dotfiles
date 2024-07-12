#!/bin/python

import json
import subprocess
import sys

WINDOW_CLASS : str = ""
WORKSPACE : str = ""
PROCESS : str = ""
COMMAND : str = ""

try:
    WINDOW_CLASS = sys.argv[1]
    WORKSPACE = sys.argv[2]
    PROCESS = sys.argv[3]
    COMMAND = sys.argv[4]

except:
    print("Please provide a window class, workspace name, process name, and run command")
    exit()

# check if the process is running
try:
    pidof_message = subprocess.check_output(["pidof", PROCESS])
except subprocess.CalledProcessError: # if not spawn it and exit
    subprocess.run(COMMAND.split())
    subprocess.run(["swaymsg", "workspace", WORKSPACE])
    exit()

message : bytes = subprocess.check_output(["swaymsg", "-t", "get_tree"]);

root_node = json.loads(message)
monitor_nodes = root_node["nodes"]

GLOBAL_WINDOW_FOUND = False

def CheckContainer(container):
    global GLOBAL_WINDOW_FOUND
    if GLOBAL_WINDOW_FOUND:
        return

    if not "window_properties" in container:
        for subcontainer in container["nodes"]:
            if not GLOBAL_WINDOW_FOUND:
                CheckContainer(subcontainer)

    else:
        if container["window_properties"]["class"] != WINDOW_CLASS: # if window doesnt match go next
            return
        else:
            GLOBAL_WINDOW_FOUND = True

        # the window has been found
        current_workspace = workspace["name"]

        if (container["focused"] == True and WORKSPACE != current_workspace): # of the window is focused move to the right workspace
            subprocess.run(["swaymsg", "move", "window", "to", "workspace", WORKSPACE])
            subprocess.run(["swaymsg", "workspace", WORKSPACE]) # follow the window
        else: # go to the workspace it is currently on
            subprocess.run(["swaymsg", "workspace", current_workspace])


for monitor in monitor_nodes: # for each monitor
    for workspace in monitor["nodes"]: # for each workspace
        for container in workspace["nodes"]: # for each container
            CheckContainer(container)
