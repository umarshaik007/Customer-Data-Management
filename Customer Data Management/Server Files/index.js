const express = require('express');
const app = express();
const cors = require("cors");
const pool = require("./db");
const { RateLimiterMemory } = require('rate-limiter-flexible');

const port = 5000;

// Apply CORS middleware
app.use(cors());

// Rate Limiting: Limit the number of requests per IP address to 100 requests per hour
const rateLimiter = new RateLimiterMemory({
    points: 100, // 100 requests
    duration: 3600, // per hour
});

// Middleware to limit requests
const rateLimitMiddleware = (req, res, next) => {
    rateLimiter.consume(req.ip)
        .then(() => {
            next();
        })
        .catch(() => {
            res.status(429).send('Too Many Requests');
        });
};

// Apply rate limiting middleware to all routes
app.use(rateLimitMiddleware);

// Error handling middleware
app.use((err, req, res, next) => {
    if (err instanceof RateLimitError) {
        res.status(429).send('Too Many Requests');
    } else {
        next();
    }
});

// Retrieve all records.
app.get("/search/all", async (req, res) => {
    try {
        const query = "SELECT sno, customer_name, age, phone, location, to_char(created_at, 'YYYY-MM-DD') AS created_date, to_char(created_at, 'HH24:MI:SS') AS created_time FROM customers";
        const result = await pool.query(query);
        res.json(result.rows);
    } catch (error) {
        console.log(error.message);
        res.status(500).send('Internal Server Error');
    }
});

// Retrieve data by id
app.get("/search/id/:id", async (req, res) => {
    try {
        const { id } = req.params;
        const result = await pool.query("SELECT * FROM customers WHERE sno = $1", [id]);
        res.json(result.rows);
    } catch (error) {
        console.log(error.message);
        res.status(500).send('Internal Server Error');
    }
});

// Retrieve data by name.
app.get("/search/name/:name", async (req, res) => {
    try {
        const { name } = req.params;
        const result = await pool.query("SELECT * FROM customers WHERE customer_name ILIKE '%' || $1 || '%'", [name]);
        res.json(result.rows);
    } catch (error) {
        console.log(error.message);
        res.status(500).send('Internal Server Error');
    }
});

// Retrieve data by name and location.
app.get("/search/name_and_location/:name/:location", async (req, res) => {
    try {
        const { name, location } = req.params;
        const result = await pool.query("SELECT * FROM customers WHERE customer_name ILIKE '%' || $1 || '%' AND location ILIKE '%' || $2 || '%'", [name, location]);
        res.json(result.rows);
    } catch (error) {
        console.log(error.message);
        res.status(500).send('Internal Server Error');
    }
});

// Retrieve data by name or location
app.get("/search/name_or_location/:name/:location", async (req, res) => {
    try {
        const { name, location } = req.params;
        const result = await pool.query("SELECT * FROM customers WHERE customer_name ILIKE '%' || $1 || '%' OR location ILIKE '%' || $2 || '%'", [name, location]);
        res.json(result.rows);
    } catch (error) {
        console.log(error.message);
        res.status(500).send('Internal Server Error');
    }
});

// Retrieve data by search string ( name or location )
app.get("/search/:search_string", async (req, res) => {
    try {
        const { search_string } = req.params;
        const result = await pool.query("SELECT * FROM customers WHERE customer_name ILIKE '%' || $1 || '%' OR location ILIKE '%' || $2 || '%'", [search_string, search_string]);
        res.json(result.rows);
    } catch (error) {
        console.log(error.message);
        res.status(500).send('Internal Server Error');
    }
});

app.listen(port, () => {
    console.log(`Server has started on port ${port}`);
});
