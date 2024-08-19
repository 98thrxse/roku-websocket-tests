# Test 1: Using BWS

### Source: (https://github.com/SuitestAutomation/BrightWebSocket)
### Important:
Run a local echo websocket server from the server folder to test

### Notes:
- Uses ASCII instead of UTF-8 for string operations
- Does not support secure web sockets at this time (ws only)


# Test 2: Using TCP bridge
### Important:
Run a local tcp server from the bridge folder to test

### How it works?
1. Send data to Websocket server:
Roku -> TCP client (BrightScript/SceneGraph) -> TCP server (NodeJS) -> Websocket client (NodeJS) -> Websocket Server
2. Receive data from Websocket server:
Websocket Server -> Websocket client (NodeJS) -> TCP server (NodeJS) -> TCP client (BrightScript/SceneGraph) -> Roku

### Notes:
- Supports secure web sockets (wss)
