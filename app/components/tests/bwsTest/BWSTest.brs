sub init()
    findNodes()
    createClient()
end sub

sub findNodes()
    m.label = m.top.findNode("label")

    setLabel()
end sub

sub setLabel()
    m.label.text = "No message"
    m.label.width = 1280
    m.label.height = 720
    m.label.horizAlign = "center"
    m.label.vertAlign = "center"
end sub

sub createClient()
    m.ws = createObject("roSGNode", "WebSocketClient")
    m.ws.observeField("on_open", "onOpen")
    m.ws.observeField("on_message", "onMessage")
    m.ws.open = "ws://192.168.0.249:8080/"
end sub

sub onOpen(event as object)
    m.ws.send = ["Hello World"]
end sub

sub onMessage(event as object)
    m.label.text = event.getData().message
end sub
