import express from "express";
const app = express();

app.get('/', (req, res) => {
    res.send("<h3>hi</h3>");
})
