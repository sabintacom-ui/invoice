@echo off
cd /d "%~dp0"
echo ======================================
echo  FITRIANTO jalan di:
echo  http://localhost:8000
echo  http://127.0.0.1:8000
echo  Jangan tutup jendela ini!
echo ======================================
where python >nul 2>nul
if errorlevel 1 (
  echo [ERROR] Python tidak ditemukan. Install Python 3 lalu ulangi.
  pause
  exit /b 1
)
start "" "http://127.0.0.1:8000"
python -m http.server 8000
pause
