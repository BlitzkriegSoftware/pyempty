import os
from fastapi import FastAPI
import uvicorn

# Create a FastAPI application instance
app = FastAPI()

listenPort = int(os.getenv("PORT", default="8080"))

# Define a path operation for the root URL ("/")
@app.get("/")
async def read_root():
    return {"message": "Hello, World!"}


if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port= listenPort, log_level="info")