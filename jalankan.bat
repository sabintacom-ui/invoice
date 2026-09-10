@echo off
cd /d "D:\AI\invoice-sabinta"
echo ======================================
echo  SABINTA jalan di:
echo  http://localhost:8000
echo  http://127.0.0.1:8000
echo  Jangan tutup jendela ini!
echo ======================================
python -m http.server 8000
pause
