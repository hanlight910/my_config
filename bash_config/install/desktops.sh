mkdir -p ~/.config/autostart 
# for file in $BASH_CONFIG/desktops/*; do 
# 	echo $file
# 	cp "$file" "$HOME/.config/autostart/${file##*/}"; 
# done

rsync -avd --delete $BASH_CONFIG/desktops/ ~/.config/autostart/
