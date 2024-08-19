1. Test 1: Using BWS (https://github.com/SuitestAutomation/BrightWebSocket)

Run a local echo websocket server from the server folder to test

Notes:
- Uses ASCII instead of UTF-8 for string operations
- Does not support secure web sockets at this time (ws only)

2. Test 2: Using TCP bridge

Run a local tcp server from the bridge folder to test.

How does it work?
Send data to Websocket server: Roku -> TCP client (BrightScript/SceneGraph) -> TCP server (NodeJS) -> Websocket client (NodeJS) -> Websocket Server
Receive data from Websocket server: Websocket Server -> Websocket client (NodeJS) -> TCP server (NodeJS) -> TCP client (BrightScript/SceneGraph) -> Roku

Notes:
- Supports secure web sockets (wss)
