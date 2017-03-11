#!/bin/bash

vanGosh_dir=$(dirname $BASH_SOURCE)

source $vanGosh_dir/colors.sh
source $vanGosh_dir/loggers.sh
source $vanGosh_dir/painters.sh

function escape () {
    echo "\e[$*m"
}

# takes a color name, returns its number
function getColorNumber () {
    local colorName=$1
    local bg=${2:-0}

    if [ "$colorName" = 0 ] ; then
        return
    fi

    local colorNumber=${colorNum[$colorName]}

    if [ "$bg" = 1 ] ; then
        echo "48;5;$colorNumber"
    else
        echo "38;5;$colorNumber"
    fi
}

# params: (fgColor, bgColor, bold=0)
# return: "<bold>;<fg>;<bg>"
# usage: `createColor yellow red 1`
function createColor () {
    local fg_name=$1
    local bg_name=${2:-0}
    local bold=${3:-0}

    local fg_number=$(getColorNumber $fg_name 0)
    local bg_number=$(getColorNumber $bg_name 1)

    # if exists precede with a semicolon ";" to split 
    local fgColor=${fg_number:+";$fg_number"}
    local bgColor=${bg_number:+";$bg_number"}

    # "<bold>;<fg>;<bg>"
    echo "${bold}${fgColor}${bgColor}"
}

# params: (createColor, text)
function paint () {
    local color=$(escape $1)

    # shift args to the left (=remove first arg)
    shift

    # "$*" contains all the remaining args (without the first, the color)
    echo -e "${color}$*${NO_COLOR}"
}

INFO_COLOR=$(createColor steel-blue 0 1)
TITLE_COLOR=$(createColor yellow 0 4)
OK_COLOR=$(createColor green 0 1)
WARN_COLOR=$(createColor orange 0 1)
HIGHLIGHT_COLOR=$(createColor yellow 0 1)
ERROR_COLOR=$(createColor red 0 1)
FAIL_COLOR=$(createColor yellow red 1)
SUCCESS_COLOR=$(createColor white green 1)

unset vanGosh_dir
