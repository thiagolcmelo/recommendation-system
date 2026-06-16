.PHONY: install lint fix format test clean

# Install dependencies using uv
install:
	uv sync

# Check for linting errors
lint:
	uv run ruff check src/

# Auto-fix formatting and linting issues
fix:
	uv run ruff format . && uv run ruff check --fix .

# Format source files
format:
	uv run ruff format src/

# Run the test suite
test:
	uv run pytest tests/ -v

# Run the sanity check script
sanity:
	uv run sanity

# Remove Python bytecode and __pycache__ directories
clean:
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
