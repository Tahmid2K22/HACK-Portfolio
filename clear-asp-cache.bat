@echo off
echo Clearing ASP.NET Temporary Files...

REM Clear .NET Framework temporary ASP.NET files
for %%v in (v2.0.50727 v4.0.30319) do (
    if exist "%WINDIR%\Microsoft.NET\Framework\%%v\Temporary ASP.NET Files\*" (
        echo Clearing Framework\%%v...
        del /F /S /Q "%WINDIR%\Microsoft.NET\Framework\%%v\Temporary ASP.NET Files\*" 2>nul
    )
    if exist "%WINDIR%\Microsoft.NET\Framework64\%%v\Temporary ASP.NET Files\*" (
        echo Clearing Framework64\%%v...
        del /F /S /Q "%WINDIR%\Microsoft.NET\Framework64\%%v\Temporary ASP.NET Files\*" 2>nul
    )
)

REM Clear local bin and obj folders
echo Clearing local bin and obj folders...
if exist "bin\*" del /F /S /Q "bin\*" 2>nul
if exist "obj\*" del /F /S /Q "obj\*" 2>nul

echo.
echo Done! Please restart your web application (IIS/IIS Express).
pause
