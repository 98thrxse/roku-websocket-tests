sub init()
    m.pages = []
    m.page = invalid
    m.pageIndex = 0
end sub

sub setFocus()
    m.page.setFocus(true)
end sub

sub setIndex(pageIndex)
    m.pageIndex = pageIndex
    update()
end sub

sub incrementIndex()
    if m.pageIndex >= m.pages.Count() - 1 then return

    m.pageIndex++
    update()
end sub

sub decrementIndex()
    if m.pageIndex <= 0 then return

    m.pageIndex--
    update()
end sub

sub remove()
    m.top.removeChild(m.page)
    m.page = invalid
end sub

sub create()
    name = m.pages[m.pageIndex]
    m.page = createObject("roSGNode", name)
    m.top.appendChild(m.page)
end sub

sub update()
    remove()
    create()
    setFocus()
end sub

sub add(name)
    m.pages.push(name)
end sub

function onKeyEvent(key as string, press as boolean) as boolean
    handled = false
    
    if press then
        if (key = "right") then
            incrementIndex()
            handled = true
        else if (key = "left") then
            decrementIndex()
            handled = true
        end if
    end if

    return handled
end function