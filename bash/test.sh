#!/bin/bash
#https://github.com/PowerShell/PowerShell/blob/master/tools/debug.sh
hash lldb-3.6 2>/dev/null || {
    echo >&2 "No lldb-3.6, please run 'sudo apt-get install lldb-3.6'"
    exit 1
}
test -x debug/powershell || {
    echo >&2 "No debug/powershell, please run 'Start-PSBuild -Publish -Output debug'"
    exit 1
}
test -x debug/libsosplugin.so || {
    echo >&2 "No debug/libsosplugin.so, please run 'Start-PSBuild -Publish -Output debug'"
    exit 1
}
