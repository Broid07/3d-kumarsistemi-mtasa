red = {}
green = {}
black = {}
local kasyno = getTeamFromName("Royal Casino")
function BetToServer (color, bet)
    if exports.global:hasMoney(source, bet) then
        exports.global:takeMoney(source, bet)
        exports.global:giveMoney(kasyno, bet)
        ilosc = 0

        if color == "red" then
            for i,v in pairs(red) do
                if red[i][1] == getPlayerName(source) then
                    ilosc = red[i][2]
                    table.remove (red,i)
                end
            end
            table.insert (red, {getPlayerName(source), tonumber(bet+ilosc)})
            triggerClientEvent("BetToClient", source, "red", bet)
        elseif color == "green" then
            for i,v in pairs(green) do
                if green[i][1] == getPlayerName(source) then
                    ilosc = green[i][2]
                    table.remove (green,i)
                end
            end
            table.insert (green, {getPlayerName(source), tonumber(bet+ilosc)})
            triggerClientEvent("BetToClient", source, "green", bet)
         elseif color == "black" then
            for i,v in pairs(black) do
                if black[i][1] == getPlayerName(source) then
                    ilosc = black[i][2]
                    table.remove (black,i)
                end
            end
            table.insert (black, {getPlayerName(source), tonumber(bet+ilosc)})
            triggerClientEvent("BetToClient", source, "black", bet)

        end
    end
end
addEvent("BetToServer", true )
addEventHandler("BetToServer", root, BetToServer)

tabela={}
for i=1,6 do
	table.insert(tabela,{0,0,200,0,"Green"})
	table.insert(tabela,{1,255,0,0,"Red"})
	table.insert(tabela,{2,0,0,0,"Black"})
	table.insert(tabela,{3,255,0,0,"Red"})
	table.insert(tabela,{4,0,0,0,"Black"})
	table.insert(tabela,{5,255,0,0,"Red"})
	table.insert(tabela,{6,0,0,0,"Black"})
	table.insert(tabela,{7,255,0,0,"Red"})
	table.insert(tabela,{8,0,0,0,"Black"})
	table.insert(tabela,{9,255,0,0,"Red"})
	table.insert(tabela,{10,0,0,0,"Black"})
	table.insert(tabela,{11,255,0,0,"Red"})
	table.insert(tabela,{12,0,0,0,"Black"})
	table.insert(tabela,{13,255,0,0,"Red"})
	table.insert(tabela,{14,0,0,0,"Black"})
end

builtins={ "Linear", "InQuad", "OutQuad", "InOutQuad", "OutInQuad", "OutBack", "InBounce", "OutBounce", "InOutBounce", "OutInBounce"}

function Start ()
    liczba = math.random(45,75)

    triggerClientEvent("ruletka:Animations", root, liczba, builtins[math.random(#builtins)])

    setTimer ( function ()
        if tabela[liczba][5] == "Red" then
            for i,v in pairs(red) do
                wygrana = red[i][2]*2
                local gracz = getPlayerFromName (red[i][1])
                if gracz then
                    exports.global:giveMoney(gracz, wygrana)
                    exports.global:takeMoney(kasyno, wygrana)
                end
            end
            red={}
            green={}
            black={}
        elseif tabela[liczba][5] == "green" then
            for i,v in pairs(green) do
                wygrana = green[i][2]*14
                local gracz = getPlayerFromName (green[i][1])
                if gracz then
                    exports.global:giveMoney(gracz, wygrana)
                    exports.global:takeMoney(kasyno, wygrana)
                end
            end
            red={}
            green={}
            black={}
        elseif tabela[liczba][5] == "Black" then
            for i,v in pairs(black) do
                wygrana = black[i][2]*2
                local gracz = getPlayerFromName (black[i][1])
                if gracz then
                    exports.global:giveMoney(gracz, wygrana)
                    exports.global:takeMoney(kasyno, wygrana)
                end
            end
        end
        red={}
        green={}
        black={}
    end, 20000, 1)
end
setTimer (Start, 21000, 0)