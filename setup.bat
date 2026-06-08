@echo off
REM QA Agent System - Automated Setup Script (Jupyter Notebook Edition)

echo ==================================
echo QA Agent System - Jupyter Edition
echo Automated Setup Script
echo ==================================
echo.

python --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Python is not installed. Please install Python 3.9+
    pause
    exit /b 1
)
echo [OK] Python found

echo.
echo Setting up backend...
cd backend

echo Creating Python virtual environment...
python -m venv venv

echo Activating virtual environment...
call venv\Scripts\activate.bat

echo Installing Python dependencies (this may take a minute)...
python -m pip install --upgrade pip --quiet
pip install -r requirements.txt --quiet

if not exist .env (
    echo Creating .env file from template...
    copy .env.example .env
    echo [WARNING] Please edit backend\.env with your credentials
) else (
    echo [OK] .env file already exists
)

cd ..

echo.
echo ==================================
echo Setup Complete!
echo ==================================
echo.

echo [OK] Backend setup complete
echo [OK] Jupyter Notebook installed

echo.
echo Next steps:
echo.
echo 1. Configure your API keys in backend\.env:
echo    - OPENAI_API_KEY
echo    - JIRA_URL
echo    - JIRA_USERNAME
echo    - JIRA_API_TOKEN
echo.
echo 2. Ensure MongoDB is running
echo    (MongoDB should run as a Windows service)
echo.
echo 3. Run Jupyter Notebook:
echo    $ cd backend
echo    $ venv\Scripts\activate
echo    $ jupyter notebook
echo.
echo 4. Open notebooks/qa_agents_main.ipynb
echo.
echo 5. Update CONFIG in cell #3 with your credentials
echo.
echo 6. Run all cells!
echo.
echo [OK] Ready to start! Follow the steps above.
echo.
pause
