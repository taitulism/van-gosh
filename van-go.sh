#!/bin/bash

function escape () {
    echo "\e[$*m"
}

# takes a color name, returns its number
function getColorNumber () {
    local colorName=$1
    local bg=${2:-false}

    if [ "$colorName" = 0 ] ;then
        return
    fi

    local colorNumber=${colorNum[$colorName]}

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
function paint () {
    local color=$(escape $1)

    # shift args to the left (=remove first arg)
    shift

    # "$*" contains all the remaining args (without the first, the color)
    echo ${color}$*${NO_COLOR}
}


function logInfo () {
    echo $(paint $INFO_COLOR $*)
}

function logTitle () {
    echo $(paint $TITLE_COLOR $*)
}

function logText () {
    echo $(paint $TEXT_COLOR $*)
}

function logComment () {
    echo $(paint $_gray $*)
}

function logOK () {
    echo $(paint $OK_COLOR $*)
}

function logWarn () {
    echo $(paint $WARN_COLOR $*)
}

function logAttention () {
    echo $(paint $HIGHLIGHT_COLOR $*)
}

function logError () {
    echo $(paint $ERROR_COLOR $*)
}

function logFail () {
    echo $(paint $FAIL_COLOR $*)
}

function logSuccess () {
    echo $(paint $SUCCESS_COLOR $*)
}

source ./colors.sh

function paintRed () {
    echo $(paint $_red $*)
}

function paintGreen () {
    echo $(paint $_green $*)
}

function paintBlue () {
    echo $(paint $_blue $*)
}

function paintYellow () {
    echo $(paint $_yellow $*)
}

function paintOrange () {
    echo $(paint $_orange $*)
}

INFO_COLOR=$(createColor steel-blue 0 1)
TITLE_COLOR=$(createColor yellow 0 4)
TEXT_COLOR=$(createColor light-gray)
OK_COLOR=$(createColor green 0 1)
WARN_COLOR=$(createColor orange 0 1)
HIGHLIGHT_COLOR=$(createColor yellow 0 1)
ERROR_COLOR=$(createColor red 0 1)
FAIL_COLOR=$(createColor yellow red 1)
SUCCESS_COLOR=$(createColor white green 1)
