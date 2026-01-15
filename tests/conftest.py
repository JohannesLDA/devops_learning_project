# tests/conftest.py

import pytest

from app.main import app


@pytest.fixture
def client():
    """Create test client for all tests."""
    app.config["TESTING"] = True
    with app.test_client() as client:
        yield client
