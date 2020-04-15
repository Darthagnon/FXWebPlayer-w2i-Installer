@echo off

rem Delay script to ensure user-provided values are read for the paths
setlocal EnableDelayedExpansion

rem Dank ASCII art FX Interactive logo
type res\logo
echo.
echo.
echo ---- FX Interactive -- FXWebPlayer -- FX Store -- w2i Game Backup Installer ----
echo.
echo This BAT file requires its resources folder and a FXGame.w2i next to it to function.
echo by Darthagnon / https://djdl.ml / 15 April 2020 A.D.
echo.
type res\line
pause

echo.
echo Where do you want to install the game?
echo (e.g. C:\Program Files (x86), D:\Games...)
set /p folderPath=

echo.
echo What is the name of the game?
set /p gameName=

rem Begin Keygen--------------------------------------------------------------------------------------------------------------------------------------
rem Generate random 40 digit HEX install token (fake ones work, too, but just in case, since we don't know exactly what it's used for, we generate one)
rem Charset for keygen, HEX values only
set char=ABCDEF0123456789
set count=0
set /a length=39

:Loop
set /a count+=1
rem The number after %% must be the number of characters in charset
set /a rand=%Random% %% 16
set key=!key!!char:~%rand%,1!
if !count! leq !length! goto Loop

rem End Keygen----------------------------------------------------------------------------------------------------------------------------------------

echo.
echo The game will be installed to %folderPath%\%gameName%
echo Temp files will be extracted to %USERPROFILE%\AppData\Local\Temp\FXWebPlayerGamez\
echo Generated Install Token will be used: %key%
echo.
echo Press [any key] to continue, or [CTRL]+[C] to cancel.
echo.
pause > nul

echo.
echo Extracting Temp files...
res\7zr.exe x -y -o%USERPROFILE%\AppData\Local\Temp\FXWebPlayerGamez\ *.w2i

rem Install the game via FXWebPlayer's w2i.exe with random Install Token. This would normally be used by FXWebPlayer / the FX Web Store to check DRM and install status, but doesn't matter here.
echo.
echo Installing...
(
res\w2i.exe /install "%USERPROFILE%\AppData\Local\Temp\FXWebPlayerGamez\" "%folderPath%\%gameName%" "%gameName%" /stealth /notify  /vDEST:"%folderPath%\%gameName%" /vENVIRONMENT:"" /vINSTALL_TOKEN:"%key%"
)

echo.
echo Cleanup Temp files...
del /f /s /q "%USERPROFILE%\AppData\Local\Temp\FXWebPlayerGamez\" > nul
rmdir /s /q "%USERPROFILE%\AppData\Local\Temp\FXWebPlayerGamez"

rem End delay
endlocal

echo.
type res\line
echo Finished installing %gameName%! Have fun!
echo Should you want to uninstall, shortcuts have been added to your Start Menu and Control Panel.
echo C:\Program Files (x86)\FX Uninstall Information will be left behind by the uninstaller. Gamesaves may optionally be kept.
pause
