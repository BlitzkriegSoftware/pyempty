# pyright: ignore[reportUnknownMemberType]

from fastapi.testclient import TestClient
import pytest

from webserver import app

client = TestClient(app)

@pytest.mark.integration
def test_read_main():
    response = client.get("/")                                
    assert response.status_code == 200                       
    assert response.json() == {"message": "Hello, World!"}   