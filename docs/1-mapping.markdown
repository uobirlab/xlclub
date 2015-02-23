In this first session we'll use the turtlebots to map the ground floor after showing off how Bob can navigate around safely. Hopefully.

This all assumes you are logged on to the laptop on the turtlebot. Open a terminal. All commands below assume you're in the `~/xl` directory.

Start the turtlebot drivers, camera and joystick control

```bash
./scripts/tbot.tmux
```

This creates a tmux session called `tbot_core` with four panes. The first shows `roscore` the remaining three are the drivers, camera and joystick control launch files.

Detach from this tmux session with `Ctrl-b d` (the lack of dash before the d means take your finger off Ctrol before hitting the d).

Next start the mapping process with 

```bash
./scripts/mapping.tmux
```

This creates a tmux session called `mapping`. The first (zeroth) pane is the mapping process. The second pane is the *super important* map saver. When the mapping is running the map is stored in memory. It is only saved to disk once you run the map saver. This is in pane 1 (switch to it with "next pane" `Ctrl-b n` or directly `Ctrl-b 1`). If you just hit return in this pane it should save the map the the file name specified after the `-f`. You must remember to do this before you stop the mapping process, else you will lose all your hard work.

Open a visualisation of the map creation process:

```bash
./scripts/visualise_mapping.sh
```

Slowly drive the robot around to build a map. Press button 5 on the joypad (top left shoulder button) to enable control and drive with the left analogue stick. Avoid fast or sudden movements and always turn the robot slowly. This makes for a better map.

Once you have saved your map and you're happy with everything, copy the map to your current dir

```bash
cp /tmp/xl_map.* ~/xl/
```
(or whatever file name you used)

When mapping is complete, kill the mapping session from the terminal with 

```bash
tmux kill-session -t mapping
```

Once you have a map, you can demonstrate autonomous navigation in it. You can do this with the following script, passing in the *full path* to the map yaml file created by the mapping process, e.g.:

```bash
./scripts/navigation.sh `pwd`/xl_map.yaml
```

or, if you haven't copied your map from tmp

```bash
./scripts/navigation.sh /tmp/xl_map.yaml
```

To work with autonomous navigation you will need the visualisation to show so extra things. Quit any current visualisation, then open a new one with:

```bash
./scripts/visualise_navigation.sh
```

You will need to us the "2D Pose Estimate" option to tell the robot where it is. You can then use "2D Nav Goal" to send it somewhere. If the robot is badly localised you can alway use the joystick to drive it first until it knows where it is a bit better.

