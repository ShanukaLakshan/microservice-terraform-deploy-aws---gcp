const express = require("express");
const app = express();

// Middleware to parse JSON
app.use(express.json());

// Basic Routes
app.get("/", (req, res) => {
  res.send("Welcome to my API!");
});

// Example of a GET route
app.get("/api/items", (req, res) => {
  const items = [
    { id: 1, name: "Item 1" },
    { id: 2, name: "Item 2" },
    { id: 3, name: "Item 3" },
  ];
  res.json(items);
});

// Example of a POST route
app.post("/api/items", (req, res) => {
  const newItem = req.body;
  if (!newItem.name) {
    return res.status(400).json({ error: "Name is required" });
  }
  newItem.id = Date.now();
  res.status(201).json(newItem);
});

// Example of a PUT route
app.put("/api/items/:id", (req, res) => {
  const { id } = req.params;
  const updatedItem = req.body;
  res.json({ message: `Item ${id} updated`, data: updatedItem });
});

// Example of a DELETE route
app.delete("/api/items/:id", (req, res) => {
  const { id } = req.params;
  res.json({ message: `Item ${id} deleted` });
});

// Start the server
const PORT = 5000;
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
