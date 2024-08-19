const WebSocket = require('ws');
const net = require('net');

const client = new WebSocket('wss://echo.websocket.org/');
const server = net.createServer((socket) => {
    const handleMessage = (data) => {
        console.log(`socket.write: ${data}`)
        socket.write(`${data}`);
    };
    
    socket.on('data', (data) => {
        console.log(`client.send: ${data}`)
        client.send(`${data}`);
    });

    socket.on('close', () => {
        client.off('message', handleMessage);
    });

    socket.on('error', (err) => {
        console.error(err);
        socket.destroy();
    });

    client.on('message', handleMessage);
});

server.listen(8080);