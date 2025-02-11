from typing import Union

from fastapi import Body, FastAPI
from pydantic import BaseModel

app = FastAPI()


@app.get("/")
def read_root():
    return {"Hello": "World"}


@app.get("/items/{item_id}")
def read_item(item_id: int, q: Union[str, None] = None):
    return {"item_id": item_id, "q": q}


class Echo(BaseModel):
    text: str


@app.post("/echo")
def echo_message(text: str = Body(...)):
    return f"Echo from python: {text}"
