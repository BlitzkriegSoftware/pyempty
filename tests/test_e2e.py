# pyright: ignore[reportUnknownMemberType]

from fastapi.testclient import TestClient
import pytest

from ..src.webserver import app

client = TestClient(app)

@pytest.mark.api
def test_read_main():
    response = client.get("/")                          # type: ignore
    assert response.status_code == 200                  # type: ignore
    assert response.json() == {"msg": "Hello World"}    # type: ignore