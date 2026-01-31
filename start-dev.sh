#!/bin/bash
# Aurea Development Server Startup Script
# Run this from the aurea folder: ./start-dev.sh

echo "🌿 Starting Aurea Development Servers..."
echo ""

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if we're in the right directory
if [ ! -d "frontend" ] || [ ! -d "backend" ]; then
    echo "Error: Please run this script from the aurea root directory"
    exit 1
fi

# Create backend .env if it doesn't exist
if [ ! -f "backend/.env" ]; then
    echo "Creating backend/.env from example..."
    cp backend/.env.example backend/.env
fi

# Create frontend .env if it doesn't exist
if [ ! -f "frontend/.env" ]; then
    echo "Creating frontend/.env..."
    echo "VITE_API_URL=http://localhost:8000" > frontend/.env
fi

# Function to cleanup on exit
cleanup() {
    echo ""
    echo "Shutting down servers..."
    kill $BACKEND_PID 2>/dev/null
    kill $FRONTEND_PID 2>/dev/null
    exit 0
}
trap cleanup SIGINT SIGTERM

# Start Backend
echo -e "${YELLOW}Starting Backend (FastAPI)...${NC}"
cd backend
pip3 install -r requirements.txt -q 2>/dev/null
python3 main.py &
BACKEND_PID=$!
cd ..

# Wait for backend to start
sleep 3

# Verify backend is running
if curl -s http://localhost:8000/health > /dev/null 2>&1; then
    echo -e "${GREEN}✓ Backend running at http://localhost:8000${NC}"
    echo -e "${GREEN}  API docs: http://localhost:8000/docs${NC}"
else
    echo "Warning: Backend may not have started correctly"
fi

# Start Frontend
echo ""
echo -e "${YELLOW}Starting Frontend (Vite)...${NC}"
cd frontend
npm install -q 2>/dev/null
npm run dev &
FRONTEND_PID=$!
cd ..

# Wait for frontend to start
sleep 5

echo ""
echo -e "${GREEN}════════════════════════════════════════${NC}"
echo -e "${GREEN}  Aurea is ready!${NC}"
echo -e "${GREEN}════════════════════════════════════════${NC}"
echo ""
echo -e "  Frontend: ${GREEN}http://localhost:5173/aurea/${NC}"
echo -e "  Backend:  ${GREEN}http://localhost:8000${NC}"
echo -e "  API Docs: ${GREEN}http://localhost:8000/docs${NC}"
echo ""
echo "Press Ctrl+C to stop both servers"
echo ""

# Wait for processes
wait
