#!/bin/bash
#!/bin/bash
echo $(wmctrl -l | grep Firefox | tail -n 1)
wmctrl -l | grep Firefox | tail -n 1 | awk '{print $1}' | xargs -I {} wmctrl -ia {}
