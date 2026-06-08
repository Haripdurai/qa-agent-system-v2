# Quick Start Guide - Jupyter Notebook Edition

Get your QA Agent System running in 5 minutes!

## ✅ Prerequisites

- [ ] Python 3.9+ installed
- [ ] MongoDB running (or Atlas account)
- [ ] OpenAI API key
- [ ] Jira account with API token

## 🚀 3-Step Setup

### Step 1: Install (2 minutes)

```bash
cd backend
python -m venv venv

# Activate virtual environment
source venv/bin/activate  # Mac/Linux
# OR
venv\Scripts\activate     # Windows

pip install -r requirements.txt
```

### Step 2: Configure (1 minute)

```bash
cp .env.example .env
nano .env  # or use any text editor
```

Update these values in `.env`:
```env
OPENAI_API_KEY=sk-your-key-here
JIRA_URL=https://your-domain.atlassian.net
JIRA_USERNAME=your-email@example.com
JIRA_API_TOKEN=your-token
MONGODB_URI=mongodb://localhost:27017/
```

### Step 3: Run (1 minute)

```bash
jupyter notebook
```

Navigate to `notebooks/qa_agents_main.ipynb` and run all cells!

## 🎯 First Use

### Update Configuration in Notebook

In cell #3 of the notebook, update:

```python
CONFIG = {
    "OPENAI_API_KEY": "sk-your-actual-key",
    "JIRA_URL": "https://your-domain.atlassian.net",
    "JIRA_USERNAME": "your-email@example.com",
    "JIRA_API_TOKEN": "your-token",
    "MONGODB_URI": "mongodb://localhost:27017/"
}
```

### Test an Agent

In the Jira Scorer test cell:

```python
ticket_id = "YOUR-TICKET-123"  # Your actual Jira ticket
result = jira_scorer.score_ticket(ticket_id)
print(result["analysis"])
```

## 📝 What Each Agent Does

1. **Jira Scorer** - Scores tickets 0-100, provides feedback
2. **Test Creator** - Generates test cases from tickets
3. **Script Generator** - Creates Selenium automation code
4. **Script Reviewer** - Reviews code quality
5. **Test Executor** - Runs tests safely

## 🔍 Quick Troubleshooting

**Jupyter won't start:**
```bash
pip install --upgrade jupyter notebook
```

**MongoDB connection error:**
```bash
# Mac:
brew services start mongodb-community

# Linux:
sudo systemctl start mongod
```

**Module not found:**
```bash
pip install -r requirements.txt
```

**Jira authentication error:**
- Check URL has no trailing slash
- Verify API token from: https://id.atlassian.com/manage-profile/security/api-tokens

## 💡 Pro Tips

- **Run cells in order** - Each builds on previous ones
- **Restart kernel** if you change CONFIG
- **Save often** - Ctrl+S or Cmd+S
- **Clear outputs** before version control

## 🎓 Complete Workflow

The notebook includes a complete workflow cell:

1. Update `ticket_id` variable
2. Run the "Complete Workflow" cell
3. Get full analysis from all 5 agents!

## 📚 Key Cells to Know

- **Cell #1**: Install dependencies (run once)
- **Cell #2**: Import libraries
- **Cell #3**: **Configure credentials HERE**
- **Cell #4**: MongoDB setup
- **Cells #5-9**: Individual agents
- **Cell #10**: Complete workflow example
- **Cell #11**: Utility functions
- **Cell #12**: Cleanup

## ⚡ Speed Run (Experienced Users)

```bash
cd backend && python -m venv venv && source venv/bin/activate
pip install -r requirements.txt && cp .env.example .env
# Edit .env with your keys
jupyter notebook
# Open qa_agents_main.ipynb
# Update CONFIG in cell #3
# Run All Cells
```

## 🆘 Need Help?

1. Check README.md for detailed docs
2. Run test cells individually to debug
3. Verify credentials in CONFIG cell
4. Ensure MongoDB is running

## 🎉 You're Ready!

Your QA Agent System is now running. Start with the Jira Scorer agent and explore from there!

---

For full documentation, see README.md
