tablica = {}

function BetToServerCrash (bet)
    if exports.global:hasMoney(source, bet) then
        exports.global:takeMoney(source, bet)
        ilosc = 0

        for i,v in pairs(tablica) do
            if tablica[i][1] == getPlayerName(source) then
                ilosc = tablica[i][2]
                table.remove (tablica,i)
            end
        end
        table.insert (tablica, {getPlayerName(source), tonumber(bet+ilosc)})
        triggerClientEvent("BetToClientCrash", source, bet)
        exports.global:giveMoney( getTeamFromName("Diamond Casino"), bet)
    end
end
addEvent("BetToServerCrash", true )
addEventHandler("BetToServerCrash", root, BetToServerCrash)

local crash = 1

function StartCrashSource ()
    setTimer ( function ()
        local los = math.random(1, 9)
        crash = 1
        if los == 1 then
            triggerClientEvent("crash:AnimationStarting", root, los)
            setTimer ( function ()
                StartCrashSource ()
                tablica={}
            end, 10100, 1)
        else
            local szczescie = math.random (1, 10)
            if szczescie <= 7 and szczescie >= 1 then
                czas = math.random(100, 10000)
            elseif szczescie <= 9 and szczescie >= 8 then
                czas = math.random(100, 20000)
            elseif szczescie == 10 then
                czas = math.random(1000, 30000)
            end
            triggerClientEvent("crash:AnimationStarting", root, 2, czas)

            setTimer ( function ()
                losujCrash = setTimer ( function ()
                    if crash > 0 and crash < 2 then
                        crash = crash + 0.01
                    elseif crash > 2 and crash < 4 then
                        crash = crash + 0.02
                    elseif crash > 4 and crash < 10 then
                        crash = crash + 0.03
                    else
                        crash = crash + 0.04
                    end
                end, 50, 0)

                setTimer ( function()
                    if isTimer(losujCrash) then
                        killTimer(losujCrash)
                    end
                    StartCrashSource ()
                    for i,v in pairs(tablica) do
                        if tablica[i][3] == "true" then
                            wygrana = tablica[i][2]*tablica[i][4]
                            local gracz = getPlayerFromName (tablica[i][1])
                            if gracz then
                                exports.global:giveMoney(gracz, wygrana)
                                exports.global:takeMoney( getTeamFromName("Diamond Casino"), wygrana)
                            end
                        end
                    end
                    tablica={}
                end, czas, 1)
            end, 10100, 1)
        end
    end, 3000, 1)
end
addEvent("crash:StartCrashSource", true )
addEventHandler("crash:StartCrashSource", getRootElement(), StartCrashSource)

setTimer (StartCrashSource, 1000, 1)

function TakeMoneyFromCrash (thePlayer)
    for i, v in pairs(tablica) do
        if tablica[i][1] == getPlayerName(thePlayer) then
            tablica[i][3] = "true"
            tablica[i][4] = crash
        end
    end
end
addEvent("crash:TakeMoneyFromCrash", true )
addEventHandler("crash:TakeMoneyFromCrash", getRootElement(), TakeMoneyFromCrash)