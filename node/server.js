import express, { application } from 'express';
const server = express();
const port = process.env.PORT;


const login = {
    name: "satisfactory",
    identity: "none",
    password: "123456"
}

server.listen(port);
console.log(`server listening on port ${port}`)

server.get('/', (req, res) => {
    console.log('wrongful request at /');
    res.status(404).send("<h2>invalid API endpoint</h2>");
})

server.get('/stop', (req, res) => {
    console.log('attempting to stop satisfactory server...');
    res.status(200).send("<h2>success</h2>");
})

server.get('/login', (req, res) => {
    console.log('login requested');
    res.status(200).json(login);
})

server.post('/login', (req, res) => {
    
})
