import express, { application } from 'express';
const server = express();
const port = process.env.PORT;

server.listen(port);
console.log(`server listening on port ${port}`)

server.get('/', (req, res) => {
    console.log('HI');
    res.send("hi");
})
