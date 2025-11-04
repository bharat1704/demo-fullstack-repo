const express = require("express");
const cors = require("cors");
const { Pool } = require("pg");

const app = express();
app.use(cors());

// PostgreSQL connection setup
const pool = new Pool({
  host: process.env.DB_HOST || "localhost",
  user: process.env.DB_USER || "postgres",
  password: process.env.DB_PASSWORD || "postgres",
  database: process.env.DB_NAME || "postgres",
  port: process.env.DB_PORT || 5432,
});

// Test DB connection route
app.get("/api/db-check", async (req, res) => {
  try {
    const result = await pool.query("SELECT NOW()");
    res.json({ message: "Database connected!", time: result.rows[0].now });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Database connection failed" });
  }
});

// Default route
app.get("/api/hello", (req, res) => {
  res.json({ message: "Hello from Node.js backend, created by Bharat!" });
});

const PORT = process.env.PORT || 80;
app.listen(PORT, () => console.log(`Backend running on port ${PORT}`));
