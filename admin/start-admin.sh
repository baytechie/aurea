#!/bin/bash
# Aurea Admin Dashboard Startup Script

echo "🌿 Starting Aurea Admin Dashboard..."
echo ""

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Install dependencies
echo -e "${YELLOW}Installing dependencies...${NC}"
pip3 install -r requirements.txt -q 2>/dev/null

# Check if backend database exists
DB_PATH="../backend/aurea.db"
TMP_DB_PATH="/tmp/aurea.db"

if [ -f "$DB_PATH" ]; then
    echo -e "${GREEN}✓ Database found at $DB_PATH${NC}"
elif [ -f "$TMP_DB_PATH" ]; then
    echo -e "${GREEN}✓ Database found at $TMP_DB_PATH${NC}"
else
    echo -e "${YELLOW}⚠ No database found. Sample data will be available.${NC}"
fi

echo ""
echo -e "${GREEN}════════════════════════════════════════${NC}"
echo -e "${GREEN}  Starting Admin Dashboard...${NC}"
echo -e "${GREEN}════════════════════════════════════════${NC}"
echo ""
echo -e "  Dashboard: ${GREEN}http://localhost:8501${NC}"
echo ""
echo "Press Ctrl+C to stop"
echo ""

# Start Streamlit
streamlit run app.py --server.port 8501 --server.address localhost
