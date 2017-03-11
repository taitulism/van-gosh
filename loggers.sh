#!/bin/bash

function logInfo () {
    echo $(paint $INFO_COLOR "$*")
}

function logTitle () {
    echo $(paint $TITLE_COLOR "$*")
}

function logText () {
    echo $(paint $_lgray "$*")
}

function logComment () {
    echo $(paint $_gray "$*")
}

function logOK () {
    echo $(paint $OK_COLOR "$*")
}

function logWarn () {
    echo $(paint $WARN_COLOR "$*")
}

function logHighlight () {
    echo $(paint $HIGHLIGHT_COLOR "$*")
}

function logError () {
    echo $(paint $ERROR_COLOR "$*")
}

function logFail () {
    echo $(paint $FAIL_COLOR "$*")
}

function logSuccess () {
    echo $(paint $SUCCESS_COLOR "$*")
}
