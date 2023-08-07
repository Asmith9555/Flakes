#!/usr/bin/env bash
theme="launcher_theme"
dir="$HOME/.config/rofi"

# rose-pine
ALPHA="#00000000"
BG="#191724"
FG="#e0def4"
SELECT="#26233a"
ACCENT="#24273A"

# rose-pine-moon
# ALPHA="#00000000"
# BG="#232136"
# FG="#e0def4"
# SELECT="#393552"
# ACCENT="#c4a7e7"
#
# rose-pine-dawn
# ALPHA="#00000000"
# BG="#faf4ed"
# FG="#575279"
# SELECT="#f2e9e1"
# ACCENT="#907aa9"

# overwrite colors file
cat > $dir/colors.rasi <<- EOF
  /* colors */

	* {
	  al:  $ALPHA;
	  bg:  $BG;
	  se:  $SELECT;
	  fg:  $FG;
	  ac:  $ACCENT;
	}
EOF

rofi -no-lazy-grab -show drun -modi drun -theme $dir/"$theme"
