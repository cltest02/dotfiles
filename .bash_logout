#!/bin/bash

#
# http://superuser.com/a/410534
#
# ~/.bash_logout is only run if it you explicitly exit the shell with exit or 
# logout, or by typing Control-D to enter an end-of-file at the command prompt. 
# If you close the terminal emulator, processes are sent SIGHUP, and bash doesn’t 
# run ~/.bash_logout in that case.
#
# If you want to perform work any time bash exits (and whether it’s a login shell 
# or not), use trap foo EXIT. The most convenient way to do this is to put your 
# code in a shell function, e.g.,:
#
## print_goodbye () { echo Goodbye; }
## trap print_goodbye EXIT

#clear