from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import List

app = FastAPI()


class Item(BaseModel):
    id: int
    name: str
    description: str = None
    price: float
    quantity: int


# In-memory storage for items
items_db = []


@app.get("/")
def read_root():
    return {"message": "Welcome to the FastAPI REST app!"}


@app.get("/items", response_model=List[Item])
def get_items():
    return items_db


@app.get("/items/{item_id}", response_model=Item)
def get_item(item_id: int):
    item = next((item for item in items_db if item.id == item_id), None)
    if item is None:
        raise HTTPException(status_code=404, detail="Item not found")
    return item


@app.post("/items", response_model=Item)
def create_item(item: Item):
    # Check for duplicate ID
    if any(existing_item.id == item.id for existing_item in items_db):
        raise HTTPException(
            status_code=400, detail="Item with this ID already exists")
    items_db.append(item)
    return item


@app.put("/items/{item_id}", response_model=Item)
def update_item(item_id: int, updated_item: Item):
    for index, existing_item in enumerate(items_db):
        if existing_item.id == item_id:
            items_db[index] = updated_item
            return updated_item
    raise HTTPException(status_code=404, detail="Item not found")


@app.delete("/items/{item_id}", response_model=dict)
def delete_item(item_id: int):
    global items_db
    items_db = [item for item in items_db if item.id != item_id]
    return {"message": f"Item with ID {item_id} deleted successfully"}
