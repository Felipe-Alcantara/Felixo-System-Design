@echo off
setlocal EnableDelayedExpansion
rem ============================================================================
rem  install-felixo.cmd - registra o comando "felixo" no CMD.
rem
rem  >>> PARA QUAL TERMINAL <<<
rem    Shell:    CMD (Prompt de Comando classico)
rem    Sistemas: Windows
rem    Use os outros instaladores se o seu terminal for:
rem      - Bash ou Zsh (Linux, macOS, Git Bash, WSL) -> install-felixo.sh
rem      - PowerShell (qualquer SO)                  -> install-felixo.ps1
rem
rem  O que faz: copia felixo.cmd para %LOCALAPPDATA%\felixo e adiciona a pasta
rem  ao PATH do usuario. Depois, abra um novo terminal e use "felixo".
rem
rem  Uso:
rem    install-felixo.cmd              instala
rem    install-felixo.cmd --uninstall  remove
rem ============================================================================

set "SRC=%~dp0felixo.cmd"
set "TARGET_DIR=%LOCALAPPDATA%\felixo"
set "TARGET=%TARGET_DIR%\felixo.cmd"

if /I "%~1"=="--uninstall" goto :uninstall
if /I "%~1"=="-u" goto :uninstall

if not exist "%SRC%" (
  echo [felixo-install X] Nao encontrei felixo.cmd ao lado deste instalador.
  exit /b 1
)

where git >nul 2>nul
if errorlevel 1 echo [felixo-install !] Aviso: git nao esta no PATH. Instale o Git antes de usar "felixo".

if not exist "%TARGET_DIR%" mkdir "%TARGET_DIR%"
copy /y "%SRC%" "%TARGET%" >nul
if errorlevel 1 (
  echo [felixo-install X] Falha ao copiar felixo.cmd para %TARGET_DIR%.
  exit /b 1
)

rem --- adiciona ao PATH do usuario se ainda nao estiver ---
echo %PATH% | find /I "%TARGET_DIR%" >nul
if errorlevel 1 (
  for /f "skip=2 tokens=2,*" %%A in ('reg query "HKCU\Environment" /v Path 2^>nul') do set "USER_PATH=%%B"
  if defined USER_PATH (
    setx PATH "!USER_PATH!;%TARGET_DIR%" >nul
  ) else (
    setx PATH "%TARGET_DIR%" >nul
  )
  echo [felixo-install OK] Pasta adicionada ao PATH do usuario: %TARGET_DIR%
) else (
  echo [felixo-install] Pasta ja estava no PATH: %TARGET_DIR%
)

echo [felixo-install OK] Comando "felixo" instalado.
echo [felixo-install] Abra um NOVO terminal e rode: felixo
echo [felixo-install]   felixo                  -^> baixa tudo, menos o submodulo
echo [felixo-install]   felixo --with-submodules -^> inclui o banco de componentes
exit /b 0

:uninstall
if exist "%TARGET%" del /q "%TARGET%"
if exist "%TARGET_DIR%" rmdir "%TARGET_DIR%" 2>nul
echo [felixo-install OK] felixo.cmd removido de %TARGET_DIR%.
echo [felixo-install] Remova manualmente "%TARGET_DIR%" do PATH em:
echo [felixo-install]   Painel de Controle ^> Sistema ^> Variaveis de Ambiente (se desejar).
exit /b 0
