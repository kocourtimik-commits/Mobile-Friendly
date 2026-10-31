@echo off
:: Prepne pracovni adresar do slozky, kde je ulozen tento .bat soubor
cd /d "%~dp0"

:: Nastaveni UTF-8 kodovani pro spravne zobrazeni cestiny
chcp 65001 >nul

echo ========================================
echo   Spoustim synchronizaci s GitHubem...
echo ========================================

echo.
echo [1/4] Stahuji nejnovejsi zmeny z GitHubu (git pull)...
git pull origin main

echo.
echo [2/4] Pridavam zmeny (git add)...
git add .

echo.
echo [3/4] Vytvarim commit...
set /p "msg=Zadejte popis zmen (nebo stisknete Enter pro vychozi): "
if "%msg%"=="" set "msg=Automaticka aktualizace"
git commit -m "%msg%"

echo.
echo [4/4] Odesilam zmeny na GitHub (git push)...
git push -u origin main

echo.
echo ========================================
echo   Hotovo! Synchronizace byla dokoncena.
echo ========================================
pause