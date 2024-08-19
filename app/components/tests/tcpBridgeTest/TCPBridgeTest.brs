sub init()
    findNodes()
    createTask()
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

sub createTask()
    m.tcpBridgeTestTask = createObject("roSGNode", "TCPBridgeTestTask")
    m.tcpBridgeTestTask.observeField("response", "onResponse")
    m.tcpBridgeTestTask.functionName = "execute"
    m.tcpBridgeTestTask.control = "RUN"

    setMessage("Message0")
end sub

function onResponse(event)
    m.label.text = event.getData()
end function

sub setMessage(message as string)
    m.tcpBridgeTestTask.request = message
end sub

function onKeyEvent(key as string, press as boolean) as boolean
    handled = false

    if press then
        if (key = "up") then
            setMessage("Message1")
            handled = true
        else if (key = "down") then
            setMessage("Message2")
            handled = true
        end if
    end if

    return handled
end function