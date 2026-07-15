import express from "express";
import type { Express } from "express";

// Creates a new Express application
const app: Express = express();

// This enables Express to handle requests that contain JSON
app.use(express.json());

// Server will be listening on port 3000
const port: number = 3000;

// An empty array to store user ids
const users: string[] = [];

app.get(
  "/",
  (_req, res) => {
    res.send("Hello world\n");
  },
);

app.get(
  "/users",
  (_req, res) => {
    return res.json({ users: users });
  },
);

app.post(
  "/users",
  (req, res) => {
    const newUserId = req.body.userId;

    if (!newUserId) {
      return res.status(400).send("Missing userId\n");
    }

    if (users.includes(newUserId)) {
      return res.status(400).send("userId already exists\n");
    }

    users.push(newUserId);
    return res.status(201).send("User registered\n");
  },
);

app.listen(
  port,
  () => {
    console.log(`\nServer listining on port ${port}\n`);
  },
);
