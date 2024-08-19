sub init()
    createClient()
    setObservers()
end sub

sub createClient()
    address = CreateObject("roSocketAddress")
    address.SetAddress("192.168.0.249:8080")

    m.socket = CreateObject("roStreamSocket")
    m.socket.setSendToAddress(address)
    if m.socket.Connect() then print "Connected Successfully"
end sub

sub setObservers()
    m.port = createObject("roMessagePort")

    m.top.observeField("request", m.port)
end sub

sub execute()
    while true
        msg = wait(0, m.port)
        if type(msg) = "roSGNodeEvent" then
            m.socket.sendStr(m.top.request)
        end if

        m.top.response = m.socket.ReceiveStr(1024)
    end while
end sub
