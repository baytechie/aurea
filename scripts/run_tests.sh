#!/bin/bash
# Aurea Test Runner
# Usage: ./scripts/run_tests.sh [options]
#
# Options:
#   all       - Run all tests (default)
#   backend   - Run backend tests only
#   schema    - Run database schema tests only
#   data      - Run data integrity tests only
#   api       - Run API endpoint tests only
#   quick     - Run quick tests (exclude slow)
#   coverage  - Run with coverage report
#   watch     - Run in watch mode (requires pytest-watch)

set -e

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
BACKEND_DIR="$PROJECT_ROOT/backend"

echo -e "${GREEN}=== Aurea Test Suite ===${NC}"
echo ""

# Default test mode
TEST_MODE="${1:-all}"

cd "$BACKEND_DIR"

# Ensure virtual environment is activated if it exists
if [ -f "$BACKEND_DIR/venv/bin/activate" ]; then
    source "$BACKEND_DIR/venv/bin/activate"
fi

# Install test dependencies if missing
pip show pytest > /dev/null 2>&1 || pip install pytest httpx

case "$TEST_MODE" in
    "all")
        echo -e "${YELLOW}Running all tests...${NC}"
        python -m pytest tests/ -v
        ;;
    "backend")
        echo -e "${YELLOW}Running backend tests...${NC}"
        python -m pytest tests/ -v
        ;;
    "schema")
        echo -e "${YELLOW}Running database schema tests...${NC}"
        python -m pytest tests/ -v -m "schema"
        ;;
    "data")
        echo -e "${YELLOW}Running data integrity tests...${NC}"
        python -m pytest tests/ -v -m "data"
        ;;
    "api")
        echo -e "${YELLOW}Running API endpoint tests...${NC}"
        python -m pytest tests/ -v -m "api"
        ;;
    "quick")
        echo -e "${YELLOW}Running quick tests (excluding slow)...${NC}"
        python -m pytest tests/ -v -m "not slow"
        ;;
    "coverage")
        echo -e "${YELLOW}Running tests with coverage...${NC}"
        pip show pytest-cov > /dev/null 2>&1 || pip install pytest-cov
        python -m pytest tests/ -v --cov=app --cov-report=term-missing --cov-report=html
        echo ""
        echo -e "${GREEN}Coverage report saved to htmlcov/index.html${NC}"
        ;;
    "watch")
        echo -e "${YELLOW}Running tests in watch mode...${NC}"
        pip show pytest-watch > /dev/null 2>&1 || pip install pytest-watch
        python -m pytest_watch tests/ -- -v
        ;;
    "ingredients")
        echo -e "${YELLOW}Running ingredients integration tests...${NC}"
        python -m pytest tests/test_ingredients_integration.py -v
        ;;
    "endpoints")
        echo -e "${YELLOW}Running endpoint tests...${NC}"
        python -m pytest tests/test_endpoints.py -v
        ;;
    *)
        echo -e "${RED}Unknown test mode: $TEST_MODE${NC}"
        echo ""
        echo "Usage: ./scripts/run_tests.sh [option]"
        echo ""
        echo "Options:"
        echo "  all         - Run all tests (default)"
        echo "  backend     - Run backend tests only"
        echo "  schema      - Run database schema tests"
        echo "  data        - Run data integrity tests"
        echo "  api         - Run API endpoint tests"
        echo "  quick       - Run quick tests (exclude slow)"
        echo "  coverage    - Run with coverage report"
        echo "  watch       - Run in watch mode"
        echo "  ingredients - Run ingredients integration tests"
        echo "  endpoints   - Run endpoint tests"
        exit 1
        ;;
esac

echo ""
echo -e "${GREEN}✅ Tests completed!${NC}"
