#!/usr/bin/env bash

source "${BASH_SOURCE%/*}/colors.sh"

FONT="IBM Plex Sans"

i3lock-color \
    --clock \
    --indicator \
    --blur 8 \
    \
    --time-font="$FONT" \
    --date-font="$FONT" \
    --layout-font="$FONT" \
    --verif-font="$FONT" \
    --wrong-font="$FONT" \
    --greeter-font="$FONT" \
    \
    --time-color=$THEME_FG1 \
    --date-color=$THEME_FG1 \
    \
    --keyhl-color=$THEME_HL2 \
    --bshl-color=$THEME_HL1 \
    \
    --inside-color=${THEME_BG0}d8 \
    --ring-color=$THEME_BG2 \
    --line-color=$THEME_BG1 \
    \
    --insidewrong-color=${THEME_BG0}d8 \
    --ringwrong-color=$THEME_HL1 \
    --wrong-color=$THEME_FG1 \
    \
    --insidever-color=${THEME_BG0}d8 \
    --ringver-color=$THEME_HL3 \
    --verif-color=$THEME_FG1
