#!/bin/bash

exit_trap_cmds=()

function on_exit() {
    exit_trap_cmds+=("$1")
}

function run_exit_trap_cmds() {
    for cmd in "${exit_trap_cmds[@]}"; do
        eval "${cmd}"
    done
}

trap run_exit_trap_cmds EXIT

function warn() {
    echo >&2 "Warning: $*"
}

function wrap_exit() {
    if [[ $# -gt 0 ]]; then
        echo >&2 "Error: $*"
    fi
    exit 1
}
_PROGRAM="${0##*/}"
function usage() {
    cat <<EOF
Usage: "${_PROGRAM}" -r 
    ...                           ...
    -v, --version                 show version of program
    -h, --help                    show this help text

Example invocation:
    ...

EOF
}

function usage_error() {
    usage >&2
    wrap_exit "$1"
}

function version() {
    echo "${_PROGRAM} 0.1"
}

while [[ $# -gt 0 ]]; do
    case $1 in
    d | --directory)
        shift
        dir=$1
        ;;
    -v | --version)
        version
        exit 0
        ;;
    -h | --help)
        usage
        exit 0
        ;;
    *)
        usage_error "Invalid option '$1'"
        ;;
    esac
done

set -e

_WORKDIR="$(mktemp -d)"
on_exit "rm -rf ${_WORKDIR}"
