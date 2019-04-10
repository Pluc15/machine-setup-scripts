#!/bin/sh

NEUTRAL='#bbbbbbff'
ACCENT='#00bb00ff'
ERROR='#bb0000ff'
NEUTRAL_DIM='#00000044'
ACCENT_DIM='#00bb0044'
ERROR_DIM='#bb000044'

i3lock \
--ringvercolor=$ACCENT \
--ringwrongcolor=$ERROR \
--ringcolor=$NEUTRAL \
\
--insidevercolor=$ACCENT_DIM \
--insidewrongcolor=$ERROR_DIM \
--insidecolor=$NEUTRAL_DIM \
\
--linecolor=$NEUTRAL \
--separatorcolor=$NEUTRAL \
--keyhlcolor=$ACCENT \
--bshlcolor=$ACCENT \
\
--verifcolor=$NEUTRAL \
--wrongcolor=$NEUTRAL \
--timecolor=$NEUTRAL \
--datecolor=$NEUTRAL \
--layoutcolor=$NEUTRAL \
\
--screen 1 \
--blur 5 \
--clock \
--indicator \
--timestr="%H:%M:%S" \
--datestr="%A, %m %Y"