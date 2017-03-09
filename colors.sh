#!/bin/bash

declare -A colorNum
# color numbers
colorNum[black]=232
colorNum[red]=160
colorNum[green]=28
colorNum[yellow]=190
colorNum[blue]=27
colorNum[steel-blue]=69
colorNum[magenta]=126
colorNum[cyan]=81
colorNum[white]=15
colorNum[pink]=207
colorNum[orange]=202
colorNum[purple]=54
colorNum[bordeaux]=88
colorNum[gray]=246
colorNum[light-gray]=253

NO_COLOR="\e[0m" # Reset Color

_red="38;5;${colorNum[red]}"
_green="38;5;${colorNum[green]}"
_lblue="38;5;${colorNum[steel-blue]}"
_yellow="38;5;${colorNum[yellow]}"
_orange="38;5;${colorNum[orange]}"
_gray="38;5;${colorNum[gray]}"
_lgray="38;5;${colorNum[light-gray]}"
