#!/bin/bash

# QA Agent System - Automated Setup Script (Jupyter Notebook Edition)
set -e

echo "=================================="
echo "QA Agent System - Jupyter Edition"
echo "Automated Setup Script"
echo "=================================="
echo ""

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

print_status() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_error() {
    echo -e "${RED}[✗]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

# Check Python
if ! command -v python3 &> /dev/null; then
    print_error "Python 3 is not installed. Please install Python 3.9+"
    exit 1
fi
print_status "Python 3 found: $(python3 --version)"

echo ""
echo "Setting up backend..."
cd backend

print_status "Creating Python virtual environment..."
python3 -m venv venv

print_status "Activating virtual environment..."
source venv/bin/activate

print_status "Installing Python dependencies (this may take a minute)..."
pip install --upgrade pip --quiet
pip install -r requirements.txt --quiet

if [ ! -f .env ]; then
    print_status "Creating .env file from template..."
    cp .env.example .env
    print_warning "Please edit backend/.env with your credentials"
else
    print_status ".env file already exists"
fi

cd ..

echo ""
echo "=================================="
echo "Setup Complete!"
echo "=================================="
echo ""

print_status "Backend setup complete"
print_status "Jupyter Notebook installed"

echo ""
echo "Next steps:"
echo ""
echo "1. Configure your API keys in backend/.env:"
echo "   - OPENAI_API_KEY"
echo "   - JIRA_URL"  
echo "   - JIRA_USERNAME"
echo "   - JIRA_API_TOKEN"
echo ""
echo "2. Start MongoDB:"
echo "   - Mac: brew services start mongodb-community"
echo "   - Linux: sudo systemctl start mongod"
echo ""
echo "3. Run Jupyter Notebook:"
echo "   $ cd backend"
echo "   $ source venv/bin/activate"
echo "   $ jupyter notebook"
echo ""
echo "4. Open notebooks/qa_agents_main.ipynb"
echo ""
echo "5. Update CONFIG in cell #3 with your credentials"
echo ""
echo "6. Run all cells!"
echo ""
print_status "Ready to start! Follow the steps above."
