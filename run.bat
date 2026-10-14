@echo off
setlocal
title Darina Preview

cd /d "%~dp0"

echo.
echo ============================================
echo      DARINA ERMAK - LOCAL PREVIEW
echo ============================================
echo.

where git >nul 2>nul
if %errorlevel%==0 (
  echo [1/4] Checking for updates from GitHub...
  git rev-parse --is-inside-work-tree >nul 2>nul
  if %errorlevel%==0 (
    git pull --ff-only
  ) else (
    echo This folder is not a Git clone. Skipping git pull.
  )
) else (
  echo [1/4] Git not found. Skipping update check.
)

where node >nul 2>nul
if not %errorlevel%==0 (
  echo.
  echo Node.js is not installed.
  echo Install the LTS version from https://nodejs.org/
  echo Then run this file again.
  echo.
  pause
  exit /b 1
)

echo.
echo [2/4] Checking dependencies...
if not exist "node_modules" (
  call npm install
  if not %errorlevel%==0 (
    echo.
    echo npm install failed.
    pause
    exit /b 1
  )
)

echo.
echo [3/4] Starting local preview...
start "" cmd /c "timeout /t 2 >nul && start http://localhost:5173"

echo.
echo [4/4] Browser will open automatically.
echo Keep this window open while previewing the site.
echo Press Ctrl+C to stop the local server.
echo.

call npm start
