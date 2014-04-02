#              _      _  _                    _               _
#  ___  _   _ | |__  | |(_) _ __ ___    ___  | |_  ___ __  __| |_
# / __|| | | || '_ \ | || || '_ ` _ \  / _ \ | __|/ _ \\ \/ /| __|
# \__ \| |_| || |_) || || || | | | | ||  __/ | |_|  __/ >  < | |_
# |___/ \__,_||_.__/ |_||_||_| |_| |_| \___|  \__|\___|/_/\_\ \__|
#
# on windows 7/8

$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")

if (!$isAdmin) {
  Write-Warning "Sublime Text installation requires elevated privileges for symlinking. Relaunch from admin console."
  Exit
}

$files = Get-ChildItem -Path "$env:USERPROFILE\dotfiles\sublime\" -Filter *.sublime-settings
$date = Get-Date -format yyyyMMdd-HHMM

foreach ($file in $files) {
  if (Test-Path "$env:APPDATA\Sublime Text 2\Packages\User\$file") {
    Move-Item "$env:APPDATA\Sublime Text 2\Packages\User\$file" "$env:APPDATA\Sublime Text 2\Packages\User\$file.$date.backup"
  }

  cmd /c mklink "$env:APPDATA\Sublime Text 2\Packages\User\$file" "$env:USERPROFILE\dotfiles\sublime\$file"
}
