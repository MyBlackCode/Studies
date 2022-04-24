@echo off
Get-ChildItem -Recurse | Sort-Object -Descending -Property Length | Select -first 1
