@echo off
setlocal EnableDelayedExpansion
rem ============================================================================
rem  felixo.cmd - baixa o repositorio Felixo System Design na pasta atual.
rem  Por padrao baixa tudo, MENOS o submodulo componets-database.
rem  Use "felixo --with-submodules" (ou "felixo -s") para incluir o submodulo.
rem  Requisitos: git no PATH (Windows 10+ para cores ANSI).
rem ============================================================================

rem --- habilita cores ANSI no console (Windows 10+) ---
for /f %%E in ('echo prompt $E ^| cmd') do set "ESC=%%E"
set "C_INFO=%ESC%[1;36m"
set "C_OK=%ESC%[1;32m"
set "C_WARN=%ESC%[1;33m"
set "C_ERR=%ESC%[1;31m"
set "C_RESET=%ESC%[0m"

set "REPO_URL=https://github.com/Felipe-Alcantara/Felixo-System-Design.git"
set "DEST_NAME=Padrão de qualidade - Felixo System Design"
set "WITH_SUB=0"

if /I "%~1"=="--with-submodules" set "WITH_SUB=1"
if /I "%~1"=="-s" set "WITH_SUB=1"
if /I "%~1"=="-h" goto :help
if /I "%~1"=="--help" goto :help

where git >nul 2>nul
if errorlevel 1 (
  echo %C_ERR%[felixo X]%C_RESET% git nao encontrado no PATH. Instale o Git e tente novamente.
  exit /b 1
)

set "CLONE_ARGS=clone --depth 1 --quiet"
if "%WITH_SUB%"=="1" (
  set "CLONE_ARGS=!CLONE_ARGS! --recurse-submodules"
  echo %C_INFO%[felixo]%C_RESET% Modo completo: incluindo submodulo componets-database.
)

echo %C_INFO%[felixo]%C_RESET% Sincronizando com %REPO_URL%
echo %C_INFO%[felixo]%C_RESET% Destino: .\%DEST_NAME%

set "TMP_DIR=%TEMP%\felixo-%RANDOM%%RANDOM%"
set "REPO_TMP=%TMP_DIR%\repo"
mkdir "%TMP_DIR%" 2>nul

echo %C_INFO%[felixo]%C_RESET% Clonando... (aguarde)
git !CLONE_ARGS! "%REPO_URL%" "%REPO_TMP%"
if errorlevel 1 (
  echo %C_ERR%[felixo X]%C_RESET% Falha ao clonar. Verifique a conexao e o acesso a %REPO_URL%.
  rmdir /s /q "%TMP_DIR%" 2>nul
  exit /b 1
)
echo %C_OK%[felixo OK]%C_RESET% Repositorio clonado.

rem --- remove diretorios .git ---
for /d /r "%REPO_TMP%" %%G in (.git) do @if exist "%%G" rmdir /s /q "%%G"

rem --- sem o modo completo, remove a pasta do submodulo (vem vazia) ---
if "%WITH_SUB%"=="0" (
  if exist "%REPO_TMP%\componets-database" rmdir /s /q "%REPO_TMP%\componets-database"
)

if not exist "%DEST_NAME%" mkdir "%DEST_NAME%"
echo %C_INFO%[felixo]%C_RESET% Aplicando arquivos...
robocopy "%REPO_TMP%" "%DEST_NAME%" /MIR /NFL /NDL /NJH /NJS /NP >nul
if %ERRORLEVEL% GEQ 8 (
  echo %C_ERR%[felixo X]%C_RESET% Falha ao copiar os arquivos (robocopy).
  rmdir /s /q "%TMP_DIR%" 2>nul
  exit /b 1
)

rmdir /s /q "%TMP_DIR%" 2>nul
echo %C_OK%[felixo OK]%C_RESET% Concluido em .\%DEST_NAME%
exit /b 0

:help
echo Uso: felixo [--with-submodules ^| -s]
echo   (sem flag)            baixa tudo, menos o submodulo componets-database
echo   --with-submodules,-s  inclui o banco de componentes
exit /b 0
