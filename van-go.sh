#!/bin/bash

function escape () {
    local escStr=$1

    echo "\e[${escStr}m"
}

# takes a color name, returns its number
function getColorNumber () {
    local colorName=$1
    local bg=${2:-false}

    if [ "$colorName" = 0 ] ;then
        return
    fi

    local colorNumber=${colorz[$colorName]}

    if [ "$bg" = 1 ] ;then
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
function colorize () {
    local color=$(escape $1)

    # shift args to the left (remove first arg)
    shift

    # "$*" contains all the remaining args (without the first, the color)
    echo ${color}$*${NO_COLOR}
}


function logInfo () {
    echo $(colorize $INFO_COLOR $*)
}

function logTitle () {
    echo $(colorize $TITLE_COLOR $*)
}

function logText () {
    echo $(colorize $TEXT_COLOR $*)
}

function logComment () {
    echo $(colorize $COMMENT_COLOR $*)
}

function logOK () {
    echo $(colorize $OK_COLOR $*)
}

function logWarn () {
    echo $(colorize $WARN_COLOR $*)
}

function logAttention () {
    echo $(colorize $HIGHLIGHT_COLOR $*)
}

function logError () {
    echo $(colorize $ERROR_COLOR $*)
}

logFail () {
    echo $(colorize $FAIL_COLOR $*)
}

function logSuccess () {
    echo $(colorize $SUCCESS_COLOR $*)
}

declare -A colorz
# color numbers
colorz[black]=232
colorz[red]=160
colorz[green]=28
colorz[yellow]=190
colorz[blue]=27
colorz[steel-blue]=69
colorz[magenta]=126
colorz[cyan]=81
colorz[white]=15
colorz[pink]=207
colorz[orange]=202
colorz[purple]=54
colorz[bordeaux]=88
colorz[gray]=246
colorz[light-gray]=253

NO_COLOR="\e[0m" # Reset Color

# full colors strings "<bold>;<fg>;<bg>"
INFO_COLOR=$(createColor steel-blue)
TITLE_COLOR=$(createColor yellow 0 4)
TEXT_COLOR=$(createColor light-gray)
COMMENT_COLOR=$(createColor gray)
OK_COLOR=$(createColor green 0 1)
WARN_COLOR=$(createColor orange 0 1)
HIGHLIGHT_COLOR=$(createColor yellow 0 1)
ERROR_COLOR=$(createColor red 0 1)
FAIL_COLOR=$(createColor yellow red 1)
SUCCESS_COLOR=$(createColor white green 1)

export -f logFail
export colorz
