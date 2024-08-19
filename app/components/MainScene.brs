sub init()
    createBasePage()
end sub

sub createBasePage()
    m.page = invalid

    m.page = createObject("roSGNode", "Page")
    m.top.appendChild(m.page)

    addPages()
    setFocus()
end sub

sub addPages()
    m.page.callFunc("add", "TCPBridgeTest")
    m.page.callFunc("add", "BWSTest")
    m.page.callFunc("update")
end sub

sub setFocus()
    m.page.setFocus(true)
end sub
