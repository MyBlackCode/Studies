@echo off

for /L %%i in (2,1,10) do (
    if %%i NEQ 7 (
	echo %%i
    )
)
