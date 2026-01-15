# tests/test_main.py

from app.main import app


def test_health_returns_200():
    """Health endpoint should return 200 OK."""
    client = app.test_client()
    response = client.get("/health")

    assert response.status_code == 200
    assert response.json == {"status": "healthy"}


def test_root_returns_message():
    """Root endpoint should return greeting."""
    client = app.test_client()
    response = client.get("/")

    assert response.status_code == 200
    assert "message" in response.json


# tests/test_main.py


def test_health(client):  # fixture injected automatically
    response = client.get("/health")
    assert response.status_code == 200


def test_root(client):
    response = client.get("/")
    assert response.status_code == 200
