@echo off

rem   __                          _        _____  __ ___
rem  / _|  ___   _ __  __      __(_) _ __ |___  |/ /( _ )
rem | |_  / _ \ | '__| \ \ /\ / /| || '_ \   / // / / _ \
rem |  _|| (_) || |     \ V  V / | || | | | / // / | (_) |
rem |_|   \___/ |_|      \_/\_/  |_||_| |_|/_//_/   \___/
rem
rem This script should be run from an elevated comment prompt

echo "-- Installing Sublime Text 2 Preferences Files"
powershell /noexit .\sublime\install.ps1
