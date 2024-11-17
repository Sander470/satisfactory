import express from "express";
const app = express();

const login = {
}

app.get('/', (req, res) => {
    res.send("<h3>not an intended route.</h3>");
    console.log('attempt access route at /');
})

app.post('/register', async (req, res) => {
    try {
        const pwd_hash = await 
    } catch (error) {
        
    }
})
