@echo off
powershell -command "Add-Type -AssemblyName System.Runtime.WindowsRuntime; \
$disp=[Windows.Graphics.Display.DisplayInformation,Windows.Graphics.Display,ContentType=WindowsRuntime]::GetForCurrentView(); \
$rot=[Windows.Graphics.Display.DisplayOrientations]::LandscapeFlipped; \
[Windows.Graphics.Display.DisplayInformation]::AutoRotationPreferences=$rot"
