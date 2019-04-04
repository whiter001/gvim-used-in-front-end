@echo off
reg query "HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layout" /v "Scancode Map"
