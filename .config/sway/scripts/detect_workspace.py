#!/bin/python

import json
import subprocess
import sys

WINDOW_CLASS : str = ""
WORKSPACE : str = ""
try:
    WINDOW_CLASS = sys.argv[1]
    WORKSPACE = sys.argv[2]
except:
    print("Please provide a window class and workspace name")
    exit()

message : bytes = subprocess.check_output(["swaymsg", "-t", "get_tree"]);

root_node = json.loads(message)
monitor_nodes = root_node["nodes"]

for monitor in monitor_nodes:
    for workspace in monitor["nodes"]:
        for container in workspace["nodes"]:
            # if there are no nested nodes
            #if len(con["nodes"]) == 0:
            if "window_properties" in container:
                if container["window_properties"]["class"] == WINDOW_CLASS:
                    print("found")
                    print(workspace["name"])
                    # move the window if its on the wrong workspace
                    if (workspace["name"] != WORKSPACE):
                        window_id = container["window"]
                        subprocess.run(["swaymsg", "move", "window", "to", "workspace", WORKSPACE])
