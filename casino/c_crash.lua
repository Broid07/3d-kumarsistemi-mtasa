local tab = {
    window = {},
    label = {},
    line = {},
    button = {},
    labelr = {},
    imager = {},
    crashList = {},
}
local bet = 0
local acceptableBet = false
local postawione = false
local tablica = {}
crash = 1
local crashe = {}

local interface = dgsCreate3DInterface(1117.3126953125, 0.353546875, 1002.137969727,4,2.015,1920*px,1080*py,tocolor(255, 255, 255, 255), 90, 1, 0)
dgs3DInterfaceSetDimension(interface, 162)
dgs3DInterfaceSetInterior(interface, 12)

tab.window[1] = dgsCreateImage(0*px, 0*py, 1920*px, 1080*py, "images/background.png", false, interface, tocolor(255,255,255,255), false)

tab.window[2] = dgsCreateImage(40*px, 40*py, 1840*px, 80*py, "images/rectangle.png", false, tab.window[1], tocolor(30,30,30,255), false)
tab.window[3] = dgsCreateImage(40*px, 40*py, 0*px, 80*py, "images/rectangle.png", false, tab.window[1], tocolor(255, 20, 20,255), false)
tab.label[1] = dgsCreateLabel(40*px, 15*py, 1840*px, 80*py, "Trwa włączanie crasha.", false, tab.window[3], tocolor(255,255,255,255), 3.5*px, 3.5*py, nil, nil, nil, "center", "top")

tab.window[5] = dgsCreateImage(650*px, 130*py, 1235*px, 480*py, "images/rectangle.png", false, tab.window[1], tocolor(0,0,0,100), false)
browser = dgsCreateMediaBrowser(1920, 1080)
dgsMediaLoadMedia(browser,"images/background.gif","IMAGE")
tab.window[4] = dgsCreateImage(655*px, 135*py, 1225*px, 470*py, browser, false, tab.window[1], tocolor(15,15,15,255))

tab.line[1] = dgsCreateLine (0*px, 0*py, 0*px, 0*py, false, tab.window[1])
tab.line[2] = dgsLineAddItem(tab.line[1], 655*px, 602*py, 655*px, 602*py, 9*px, tocolor(255,150,0,200), false)

tab.label[4] = dgsCreateLabel(655*px, 135*py, 1225*px, 470*py, "Döndürülüyor...", false, tab.window[1], tocolor(255,255,255,255), 1*px, 1*py, nil, nil, nil, "center", "center")
dgsSetFont(tab.label[4], font)

tab.label[2] = dgsCreateImage(40*px, 130*py, 606*px, 920*py, "images/rectangle.png", false, tab.window[1], tocolor(0, 0, 0, 100), false)
tab.label[3] = dgsCreateImage(40*px, 130*py, 606*px, 100*py, "images/rectangle.png", false, tab.window[1], tocolor(0, 0, 0, 100), false)
tab.label[5] = dgsCreateLabel(40*px, 130*py, 606*px, 100*py, "Oyuuncu               Bahis", false, tab.window[1], tocolor(255,255,255,255), 4*px, 4*py, nil, nil, nil, "center", "center")

tab.window[6] = dgsCreateImage(650*px, 900*py, 1235*px, 150*py, "images/rectangle.png", false, tab.window[1], tocolor(30,30,30,255), false)

tab.window[7] = dgsCreateImage(650*px, 615*py, 1235*px, 280*py, "images/rectangle.png", false, tab.window[1], tocolor(30,30,30,255), false)
tab.window[9] = dgsCreateImage(655*px, 620*py, 607*px, 130*py, "images/rectangle.png", false, tab.window[1], tocolor(20,20,20,255), false)
tab.label[6] = dgsCreateLabel(655*px, 620*py, 607*px, 130*py, "Paran: $", false, tab.window[1], tocolor(255,255,255,255), 3.5*px, 3.5*py, nil, nil, nil, "center", "center")

tab.window[10] = dgsCreateImage(1267*px, 620*py, 612*px, 130*py, "images/rectangle.png", false, tab.window[1], tocolor(20,20,20,255), false)
tab.label[7] = dgsCreateLabel(1267*px, 620*py, 612*px, 130*py, "Bahsin: ", false, tab.window[1], tocolor(255,255,255,255), 3.5*px, 3.5*py, nil, nil, nil, "center", "center")

tab.window[11] = dgsCreateImage(655*px, 755*py, 1225*px, 130*py, "images/rectangle.png", false, tab.window[1], tocolor(20,20,20,255), false)
tab.button[1] = dgsCreateButton(660*px, 760*py, 200*px, 120*py, "Temizle", false, tab.window[1], tocolor(200, 200, 200, 255), 3*px, 3*py, nil, nil, nil, tocolor(30,30,30,255), tocolor(50,50,50,255))
tab.button[2] = dgsCreateButton(865*px, 760*py, 200*px, 120*py, "+10", false, tab.window[1], tocolor(200, 200, 200, 255), 3*px, 3*py, nil, nil, nil, tocolor(30,30,30,255), tocolor(50,50,50,255))
tab.button[3] = dgsCreateButton(1070*px, 760*py, 200*px, 120*py, "+100", false, tab.window[1], tocolor(200, 200, 200, 255), 3*px, 3*py, nil, nil, nil, tocolor(30,30,30,255), tocolor(50,50,50,255))
tab.button[4] = dgsCreateButton(1275*px, 760*py, 200*px, 120*py, "+1000", false, tab.window[1], tocolor(200, 200, 200, 255), 3*px, 3*py, nil, nil, nil, tocolor(30,30,30,255), tocolor(50,50,50,255))
tab.button[5] = dgsCreateButton(1480*px, 760*py, 195*px, 120*py, "Bahis", false, tab.window[1], tocolor(200, 200, 200, 255), 3*px, 3*py, nil, nil, nil, tocolor(30,30,30,255), tocolor(50,50,50,255))
tab.button[6] = dgsCreateButton(1680*px, 760*py, 195*px, 120*py, "Durdur", false, tab.window[1], tocolor(200, 200, 200, 255), 3*px, 3*py, nil, nil, nil, tocolor(30,30,30,255), tocolor(50,50,50,255))

setTimer ( function ()
    if not getElementData(localPlayer, "loggedin") == 1 then return end
    if getElementDimension(localPlayer) == 1872 then
        money = getElementData(localPlayer, "money") or 0
        dgsSetText(tab.label[6], "Balance: $"..money)
        dgsBringToFront(tab.window[9])
        dgsBringToFront(tab.window[11])
        dgsBringToFront(tab.window[10])
        dgsBringToFront(tab.label[7])
        dgsBringToFront(tab.label[6])
        for i=1, 6 do
            dgsBringToFront(tab.button[i])
        end
    end
end, 3000, 0)

addEventHandler("onDgsMouseClick",root, function(button, state)
    if state == "up" then
        if source == tab.button[1] then
            if acceptableBet then
                bet = 0
                dgsSetText(tab.label[7], "Bahsin: "..bet)
            end
        elseif source == tab.button[2] then
            if acceptableBet then
                if exports.global:hasMoney(localPlayer, bet+10) then
                    bet = bet + 10
                    dgsSetText(tab.label[7], "Bahsin: "..bet)
                end
            end
        elseif source == tab.button[3] then
            if acceptableBet then
                if exports.global:hasMoney(localPlayer, bet+100) then
                    bet = bet + 100
                    dgsSetText(tab.label[7], "Bahsin: "..bet)
                end
            end
        elseif source == tab.button[4] then
            if acceptableBet then
                if exports.global:hasMoney(localPlayer, bet+1000) then
                    bet = bet + 1000
                    dgsSetText(tab.label[7], "Bahsin: "..bet)
                end
            end
        elseif source == tab.button[5] then
            if acceptableBet then
                if bet > 0 then
                    if exports.global:hasMoney(localPlayer, bet) then
                        triggerServerEvent ("BetToServerCrash", localPlayer, bet)
                        dgsSetText(tab.label[6], "Paran: $"..getElementData(localPlayer, "money") - bet)
                        postawione = true
                    end
                end
            end
        elseif source == tab.button[6] then
            if (acceptableBet == false) and (postawione == true) then
                triggerServerEvent("crash:TakeMoneyFromCrash", localPlayer, localPlayer)
                bet = 0
                dgsSetText(tab.label[7], "Bahsin: "..bet)
                postawione = false

                for i,v in pairs(tablica) do
                    if tablica[i][1] == getPlayerName(localPlayer) then
                        dgsSetProperty(tab.labelr[i], "color", tocolor(0,200,0,100))
                    end
                end
            end
        end
    end
end)

function BetToClientCrash (bet)
    ilosc = 0
    for i,v in pairs(tablica) do
        
        if tablica[i][1] == getPlayerName(source) then
            ilosc = tablica[i][2]
            table.remove (tablica,i)
        end
    end
    table.insert (tablica,{""..getPlayerName(source).."", tonumber(bet+ilosc)})
    table.sort(tablica, function(a, b) return a[2]>b[2] end)

    y = 0
    for i,v in pairs(tablica) do
        if isElement(tab.labelr[i]) then
            destroyElement(tab.labelr[i])
            destroyElement(tab.imager[i])
        end
        tab.labelr[i] = dgsCreateImage(40*px, (235+y)*py, 606*px, 50*py, "images/rectangle.png", false, tab.window[1], tocolor(50, 50, 0, 150), false)
        tab.imager[i] = dgsCreateLabel(50*px, (235+y)*py, 606*px, 50*py, v[1].." - $"..v[2], false, tab.window[1], tocolor(255,255,255,255), 3*px, 3*py, nil, nil, nil, "left", "top")
        y = y + 52
    end
end
addEvent("BetToClientCrash", true )
addEventHandler("BetToClientCrash", root, BetToClientCrash)

function AnimationStarting (los, czas)
    acceptableBet = true
    crash = 1
    if isEventHandlerAdded ("onClientRender", getRootElement(), RenderCrashLine) then
        removeEventHandler("onClientRender", getRootElement(), RenderCrashLine)
    end
    dgsLineSetItemPosition(tab.line[1], tab.line[2], 655*px, 602*py, 655*px, 602*py)
    dgsSetSize(tab.window[3], 1840*px, 80*py)
    dgsSizeTo(tab.window[3], 0*px, 80*py, false,false,"Linear",10000)
    dgsSetProperty(tab.window[4], "color", tocolor(15,15,15,255))
    dgsLabelSetColor(tab.label[4], 255, 255, 255, 255)
    dgsSetText(tab.label[4], "Döndürülüyor...")
    losowanie = 10
    dgsSetText(tab.label[1], "Kalan Süre "..losowanie.."..")
    setTimer (function ()
        losowanie = losowanie - 1
        dgsSetText(tab.label[1], "Kalan Süre "..losowanie.."..")
    end, 1000, 10)

    x = 0
    tekst = ""
    for i, v in ipairs(crashe) do
        if isElement(tab.crashList[i]) then
            destroyElement(tab.crashList[i])
        end
        --x = x + 90
        tekst = tekst..""..v.." | "
    end
    if isElement(tab.crashList[1]) then
        destroyElement(tab.crashList[1])
        tab.crashList[1] = dgsCreateLabel((650+x)*px, 900*py, 1235*px, 150*py, tekst, false, tab.window[1], tocolor(255,0,0,255), 1*px, 1*py, nil, nil, nil, "center", "center")
        dgsSetFont(tab.crashList[1], fontSmall)
    else
        tab.crashList[1] = dgsCreateLabel((650+x)*px, 900*py, 1235*px, 150*py, tekst, false, tab.window[1], tocolor(255,0,0,255), 1*px, 1*py, nil, nil, nil, "center", "center")
        dgsSetFont(tab.crashList[1], fontSmall)
    end

    setTimer ( function ()
        acceptableBet = false
        if los == 1 then
            dgsSetText(tab.label[1], "")
            dgsSetText(tab.label[4], "Crash na 1.00")
            dgsLabelSetColor(tab.label[4], 255, 0, 0, 255)
            dgsSetProperty(tab.window[4], "color", tocolor(15,15,15,255))
            for i, v in pairs(tablica) do
                if isElement(tab.labelr[i]) then
                    destroyElement(tab.labelr[i])
                    destroyElement(tab.imager[i])
                end
            end
            tablica={}
            bet = 0
            dgsSetText(tab.label[7], "Bahsin: "..bet)
            i = 0
            for i, v in ipairs(crashe) do
                i = i + 1
                if i == 7 then
                    table.remove(crashe, 1)
                end
            end
            table.insert(crashe, "1.00")
        else
            dgsSetText(tab.label[1], "")
            dgsSetProperty(tab.window[4], "color", tocolor(50,50,50,255))
            crashTicks = getTickCount()
            addEventHandler("onClientRender", getRootElement(), RenderCrashLine)

            losujCrash = setTimer ( function ()
                if crash > 0 and crash < 2 then
                    crash = crash + 0.01
                    dgsSetText(tab.label[4], "x "..crash)
                elseif crash > 2 and crash < 4 then
                    crash = crash + 0.02
                    dgsSetText(tab.label[4], "x "..crash)
                elseif crash > 4 and crash < 10 then
                    crash = crash + 0.03
                    dgsSetText(tab.label[4], "x "..crash)
                else
                    crash = crash + 0.04
                    dgsSetText(tab.label[4], "x "..crash)
                end
            end, 50, 0)

            setTimer ( function ()
                if isTimer(losujCrash) then
                    killTimer(losujCrash)
                end
                i = 0
                for i, v in ipairs(crashe) do
                    i = i + 1
                    if i == 7 then
                        table.remove(crashe, 1)
                    end
                end
                table.insert(crashe, tostring(crash))
                if isEventHandlerAdded ("onClientRender", getRootElement(), RenderCrashLine) then
                    removeEventHandler("onClientRender", getRootElement(), RenderCrashLine)
                end
                dgsSetText(tab.label[1], "")
                dgsSetProperty(tab.window[4], "color", tocolor(15,15,15,255))
                dgsSetText(tab.label[4], "Crash na "..crash)
                dgsLabelSetColor(tab.label[4], 255, 0, 0, 255)
                for i, v in pairs(tablica) do
                    if isElement(tab.labelr[i]) then
                        destroyElement(tab.labelr[i])
                        destroyElement(tab.imager[i])
                    end
                end
                tablica={}
                bet = 0
                dgsSetText(tab.label[7], "Bahsin: "..bet)
            end, czas, 1)
        end
    end, 10100, 1)
end
addEvent("crash:AnimationStarting", true )
addEventHandler("crash:AnimationStarting", getRootElement(), AnimationStarting )

function RenderCrashLine ()
    local progresstick = getTickCount() - crashTicks
    local progress = progresstick/60000

    dgsLineSetItemPosition(tab.line[1], tab.line[2], 655*px, 602*py, interpolateBetween(655,0,0,1880,0,0,progress,"Linear")*px, interpolateBetween(602,0,0,138,0,0,progress,"Linear")*py)
end