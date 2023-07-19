loadstring(exports.dgs:dgsImportFunction())()

local tab = {
    window = {},
    button = {},
    info = {},
	images = {},
	label = {},
    labelr = {},
    labelg = {},
    labelb = {},
    imager = {},
    imageg = {},
    imageb = {},
    imageAnim = {},
}
local bet = 0
local losowanie = 5
local mozliwybet = true
red = {}
green = {}
black = {}
random = 15
start = getTickCount()
koniec= getTickCount()
x = 0
tabela={}
for i=1,6 do
	table.insert(tabela,{0,0,200,0,"Green"})
	table.insert(tabela,{1,255,0,0,"Red"})
	table.insert(tabela,{2,0,0,0,"Siyah"})
	table.insert(tabela,{3,255,0,0,"Red"})
	table.insert(tabela,{4,0,0,0,"Siyah"})
	table.insert(tabela,{5,255,0,0,"Red"})
	table.insert(tabela,{6,0,0,0,"Siyah"})
	table.insert(tabela,{7,255,0,0,"Red"})
	table.insert(tabela,{8,0,0,0,"Siyah"})
	table.insert(tabela,{9,255,0,0,"Red"})
	table.insert(tabela,{10,0,0,0,"Siyah"})
	table.insert(tabela,{11,255,0,0,"Red"})
	table.insert(tabela,{12,0,0,0,"Siyah"})
	table.insert(tabela,{13,255,0,0,"Red"})
	table.insert(tabela,{14,0,0,0,"Siyah"})
end

local interface = dgsCreate3DInterface(1117.3526953125, -3.635546875, 1002.137969727,4,2.015,1920*px,1080*py,tocolor(255, 255, 255, 255), 90, 1, 0)
dgs3DInterfaceSetDimension(interface, 162)
dgs3DInterfaceSetInterior(interface, 12)

local interfacee = dgsCreate3DInterface(1117.362963125, -3.637546875, 1002.737969727,3.828,0.34,1840*px,180*py,tocolor(255, 255, 255, 255), 90, 1, 0)
dgs3DInterfaceSetDimension(interfacee, 162)
dgs3DInterfaceSetInterior(interfacee, 12)

tab.window[1] = dgsCreateImage(0*px, 0*py, 1920*px, 1080*py, "images/background.png", false, interface, tocolor(255,255,255,255), false)

tab.window[2] = dgsCreateImage(40*px, 40*py, 1840*px, 80*py, "images/rectangle.png", false, tab.window[1], tocolor(30,30,30,255), false)
tab.window[3] = dgsCreateImage(40*px, 40*py, 0*px, 80*py, "images/rectangle.png", false, tab.window[1], tocolor(255, 20, 20,255), false)
tab.label[1] = dgsCreateLabel(40*px, 15*py, 1840*px, 80*py, "Algoritma Yükleniyor..", false, tab.window[3], tocolor(255,255,255,255), 3.5*px, 3.5*py, nil, nil, nil, "center", "top")

tab.window[4] = dgsCreateImage(40*px, 130*py, 1840*px, 180*py, "images/rectangle.png", false, tab.window[1], tocolor(30,30,30,255), false) --animacja bg
tab.window[6] = dgsCreateImage(910*px, 0*py, 10*px, 180*py, "images/rectangle.png", false, interfacee, tocolor(255,255,255,255), false) --animacja bg

tab.window[5] = dgsCreateImage(40*px, 320*py, 1840*px, 120*py, "images/rectangle.png", false, tab.window[1], tocolor(30,30,30,255), false)

tab.info[1] = dgsCreateImage(10*px, 10*py, 500*px, 100*py, "images/rectangle.png", false, tab.window[5], tocolor(20,20,20,255), false)
tab.label[2] = dgsCreateLabel(20*px, 10*py, 1840*px, 80*py, "Paran: $", false, tab.info[1], tocolor(255,255,255,255), 3.5*px, 3.5*py, nil, nil, nil, "left", "center")

tab.info[2] = dgsCreateImage(520*px, 10*py, 1310*px, 100*py, "images/rectangle.png", false, tab.window[5], tocolor(20,20,20,255), false)
tab.label[3] = dgsCreateLabel(20*px, 10*py, 300*px, 80*py, "Bahsin: "..bet, false, tab.info[2], tocolor(255,255,255,255), 3.5*px, 3.5*py, nil, nil, nil, "left", "center")
tab.button[1] = dgsCreateButton(500*px, 10*py, 200*px, 80*py, "Temizle", false, tab.info[2], tocolor(200, 200, 200, 255), 3*px, 3*py, nil, nil, nil, tocolor(30,30,30,255), tocolor(50,50,50,255))
tab.button[2] = dgsCreateButton(710*px, 10*py, 100*px, 80*py, "+10", false, tab.info[2], tocolor(200, 200, 200, 255), 3*px, 3*py, nil, nil, nil, tocolor(30,30,30,255), tocolor(50,50,50,255))
tab.button[3] = dgsCreateButton(820*px, 10*py, 130*px, 80*py, "+100", false, tab.info[2], tocolor(200, 200, 200, 255), 3*px, 3*py, nil, nil, nil, tocolor(30,30,30,255), tocolor(50,50,50,255))
tab.button[4] = dgsCreateButton(960*px, 10*py, 170*px, 80*py, "+1000", false, tab.info[2], tocolor(200, 200, 200, 255), 3*px, 3*py, nil, nil, nil, tocolor(30,30,30,255), tocolor(50,50,50,255))
tab.button[5] = dgsCreateButton(1140*px, 10*py, 160*px, 80*py, "MAX", false, tab.info[2], tocolor(200, 200, 200, 255), 3*px, 3*py, nil, nil, nil, tocolor(30,30,30,255), tocolor(50,50,50,255))

tab.button[6] = dgsCreateButton(40*px, 450*py, 606*px, 80*py, "Red x2", false, tab.window[1], tocolor(200, 200, 200, 255), 3*px, 3*py, nil, nil, nil, tocolor(100, 0, 0,200), tocolor(120, 0, 0,255))
tab.button[7] = dgsCreateButton(656*px, 450*py, 606*px, 80*py, "Green x14", false, tab.window[1], tocolor(200, 200, 200, 255), 3*px, 3*py, nil, nil, nil, tocolor(0, 100, 0,200), tocolor(0, 120, 0,255))
tab.button[8] = dgsCreateButton(1272*px, 450*py, 606*px, 80*py, "Black x2", false, tab.window[1], tocolor(200, 200, 200, 255), 3*px, 3*py, nil, nil, nil, tocolor(0,0,0,200), tocolor(0,0,0,255))
tab.info[3] = dgsCreateImage(40*px, 540*py, 606*px, 60*py, "images/rectangle.png", false, tab.window[1], tocolor(20, 20, 20,200), false) --animacja bg
tab.label[4] = dgsCreateLabel(0*px, 10*py, 606*px, 40*py, "$", false, tab.info[3], tocolor(255,255,255,255), 3*px, 3*py, nil, nil, nil, "center", "center")
tab.info[4] = dgsCreateImage(656*px, 540*py, 606*px, 60*py, "images/rectangle.png", false, tab.window[1], tocolor(20, 20, 20,200), false) --animacja bg
tab.label[5] = dgsCreateLabel(0*px, 10*py, 606*px, 40*py, "$", false, tab.info[4], tocolor(255,255,255,255), 3*px, 3*py, nil, nil, nil, "center", "center")
tab.info[5] = dgsCreateImage(1272*px, 540*py, 606*px, 60*py, "images/rectangle.png", false, tab.window[1], tocolor(20, 20, 20,200), false) --animacja bg
tab.label[6] = dgsCreateLabel(0*px, 10*py, 606*px, 40*py, "$", false, tab.info[5], tocolor(255,255,255,255), 3*px, 3*py, nil, nil, nil, "center", "center")

tab.label[7] = dgsCreateImage(40*px, 610*py, 606*px, 438*py, "images/rectangle.png", false, tab.window[1], tocolor(0, 0, 0, 100), false)
tab.label[8] = dgsCreateImage(656*px, 610*py, 606*px, 438*py, "images/rectangle.png", false, tab.window[1], tocolor(0, 0, 0, 100), false)
tab.label[9] = dgsCreateImage(1272*px, 610*py, 606*px, 438*py, "images/rectangle.png", false, tab.window[1], tocolor(0, 0, 0, 100), false)

setTimer ( function ()
    if not getElementData(localPlayer, "loggedin") == 1 then return end
    if getElementDimension(localPlayer) == 1872 then
        money = getElementData(localPlayer, "money") or 0
        dgsSetText(tab.label[2], "Paran: $"..money)
        dgsBringToFront(tab.window[6])
    end
end, 3000, 0)

addEventHandler("onDgsMouseClick",root, function(button, state)
    if state == "up" then
        if source == tab.button[1] then
            bet = 0
            dgsSetText(tab.label[3], "Bahsin: "..bet)
        elseif source == tab.button[2] then
            if exports.global:hasMoney(localPlayer, bet+10) then
                bet = bet + 10
                dgsSetText(tab.label[3], "Bahsin: "..bet)
            end
        elseif source == tab.button[3] then
            if exports.global:hasMoney(localPlayer, bet+100) then
                bet = bet + 100
                dgsSetText(tab.label[3], "Bahsin: "..bet)
            end
        elseif source == tab.button[4] then
            if exports.global:hasMoney(localPlayer, bet+1000) then
                bet = bet + 1000
                dgsSetText(tab.label[3], "Bahsin: "..bet)
            end
        elseif source == tab.button[5] then
            bet = getElementData(localPlayer, "money") or 0
            dgsSetText(tab.label[3], "Bahsin: "..bet)
        elseif source == tab.button[6] then
            if bet > 0 then
                if mozliwyBet then
                    triggerServerEvent ("BetToServer", localPlayer, "red", bet)
                    dgsSetText(tab.label[2], "Paran: $"..getElementData(localPlayer, "money") - bet)
                end
            end
        elseif source == tab.button[7] then
            if bet > 0 then
                if mozliwyBet then
                    triggerServerEvent ("BetToServer", localPlayer, "green", bet)
                    dgsSetText(tab.label[2], "Paran: $"..getElementData(localPlayer, "money") - bet)
                end
            end
        elseif source == tab.button[8] then
            if bet > 0 then
                if mozliwyBet then
                    triggerServerEvent ("BetToServer", localPlayer, "black", bet)
                    dgsSetText(tab.label[2], "Paran: $"..getElementData(localPlayer, "money") - bet)
                end
            end
        end
    end
end)

for i,v in pairs(tabela) do
    tab.imageAnim[i] = dgsCreateImage(px*x, 0*py, 150*px, 180*py, "images/rectangle.png", false, interfacee, tocolor(v[2], v[3], v[4], 255), false)
    x=x+150
end

function BetToClient (color, bet)
    ilosc = 0
    if color == "red" then
        for i,v in pairs(red) do
            
            if red[i][1] == getPlayerName(source) then
                ilosc = red[i][2]
                table.remove (red,i)
            end
        end
        table.insert (red,{""..getPlayerName(source).."", tonumber(bet+ilosc)})
        table.sort(red, function(a, b) return a[2]>b[2] end)

        y = 0
        for i,v in pairs(red) do
            if isElement(tab.labelr[i]) then
                destroyElement(tab.labelr[i])
                destroyElement(tab.imager[i])
            end
            tab.labelr[i] = dgsCreateImage(40*px, (610+y)*py, 606*px, 50*py, "images/rectangle.png", false, tab.window[1], tocolor(50, 0, 0, 150), false)
            tab.imager[i] = dgsCreateLabel(50*px, (610+y)*py, 606*px, 50*py, v[1].." - $"..v[2], false, tab.window[1], tocolor(255,255,255,255), 3*px, 3*py, nil, nil, nil, "left", "top")
            y = y + 52
        end
    elseif color == "green" then
        for i,v in pairs(green) do
            
            if green[i][1] == getPlayerName(source) then
                ilosc = green[i][2]
                table.remove (green,i)
            end
        end
        table.insert (green,{""..getPlayerName(source).."", tonumber(bet+ilosc)})
        table.sort(green, function(a, b) return a[2]>b[2] end)

        y = 0
        for i,v in pairs(green) do
            if isElement(tab.labelg[i]) then
                destroyElement(tab.labelg[i])
                destroyElement(tab.imageg[i])
            end
            tab.labelg[i] = dgsCreateImage(656*px, (610+y)*py, 606*px, 50*py, "images/rectangle.png", false, tab.window[1], tocolor(0, 50, 0, 150), false)
            tab.imageg[i] = dgsCreateLabel(666*px, (610+y)*py, 606*px, 50*py, v[1].." - $"..v[2], false, tab.window[1], tocolor(255,255,255,255), 3*px, 3*py, nil, nil, nil, "left", "top")
            y = y + 52
        end
    elseif color == "black" then
        for i,v in pairs(black) do
            
            if black[i][1] == getPlayerName(source) then
                ilosc = black[i][2]
                table.remove (black,i)
            end
        end
        table.insert (black,{""..getPlayerName(source).."", tonumber(bet+ilosc)})
        table.sort(black, function(a, b) return a[2]>b[2] end)

        y = 0
        for i,v in pairs(black) do
            if isElement(tab.labelb[i]) then
                destroyElement(tab.labelb[i])
                destroyElement(tab.imageb[i])
            end
            tab.labelb[i] = dgsCreateImage(1272*px, (610+y)*py, 606*px, 50*py, "images/rectangle.png", false, tab.window[1], tocolor(0, 0, 0, 150), false)
            tab.imageb[i] = dgsCreateLabel(1282*px, (610+y)*py, 606*px, 50*py, v[1].." - $"..v[2], false, tab.window[1], tocolor(255,255,255,255), 3*px, 3*py, nil, nil, nil, "left", "top")
            y = y + 52
        end
    end
end
addEvent("BetToClient", true )
addEventHandler("BetToClient", root, BetToClient)

function Animations (liczba, anim)
    if isElement(tab.label[1]) then
        dgsSetVisible(tab.label[1], true)
    end
    if isElement(tab.window[3]) then
        dgsSetSize(tab.window[3], 1840*px, 80*py)
        dgsSizeTo(tab.window[3], 0*px, 80*py, false,false,'Linear',15000)
    end
    losowanie = 15
    dgsSetText(tab.label[1], "Dönmeye Kalan Süre "..losowanie.."..")
    setTimer (function ()
        losowanie = losowanie - 1
        if isElement(tab.label[1]) then
            dgsSetText(tab.label[1], "Dönmeye Kalan Süre "..losowanie.."..")
        end
    end, 1000, 15)
    mozliwyBet = true

    setTimer ( function ()
        if isElement(tab.label[1]) then
            dgsSetVisible(tab.label[1], false)
        end
        random = liczba
        animacja = anim
        start = getTickCount()
        koniec= getTickCount()+5000
        mozliwyBet = false

        x = 0
        for i,v in pairs(tabela) do
            if isElement(tab.imageAnim[i]) then
                dgsSetPosition(tab.imageAnim[i], px*x, 0*py, false)
            end
            x=x+150
        end

        addEventHandler("onClientRender", getRootElement(), RenderBasicAnimation)
        setTimer ( function()
            for i, v in pairs(red) do
                if isElement(tab.labelr[i]) then
                    destroyElement(tab.labelr[i])
                    destroyElement(tab.imager[i])
                end
            end
            for i, v in pairs(green) do
                if isElement(tab.labelg[i]) then
                    destroyElement(tab.labelg[i])
                    destroyElement(tab.imageg[i])
                end
            end
            for i, v in pairs(black) do
                if isElement(tab.labelb[i]) then
                    destroyElement(tab.labelb[i])
                    destroyElement(tab.imageb[i])
                end
            end
            red={}
            green={}
            black={}
            removeEventHandler("onClientRender", getRootElement(), RenderBasicAnimation)
        end, 5000, 1)
    end, 15000, 1)
end
addEvent( "ruletka:Animations", true )
addEventHandler( "ruletka:Animations", getRootElement(), Animations )

function RenderBasicAnimation ()
    local dim = getElementDimension(localPlayer)
    if dim == 1872 then
        x = 150*6.62
        local postep =  (getTickCount()- start)/(koniec- start)
        przesuniecie = interpolateBetween(-15*150,0,0,px*-random*150,0,0,postep ,animacja)
        for i,v in pairs(tabela) do
            dgsSetPosition(tab.imageAnim[i], px*x+przesuniecie, 0*py, false)
            x=x+150
        end
    end
end