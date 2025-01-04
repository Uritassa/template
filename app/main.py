import uvicorn
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def root():
    return {"message": "This is a demo"}

@app.get("/healthz")
def healthz():
    return {"status": "ok", "database": "connected"}

@app.get("/ready")
def healthz():
    return {"status": "ok", "app": "ready"}

if __name__ == "__main__":
    uvicorn.run("main:app", port=8000, reload=True) 

