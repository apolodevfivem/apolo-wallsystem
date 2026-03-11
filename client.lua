-- Apolo Dev --

local WallAtivado = false
local ServerInfos = {} -- Adicionado para quando quiser trazer informações para o client-side do wall
local DistanciaConfig = 200 -- Distância pra ver o esp do player
local VidaMaximaConfig = 200

Citizen.CreateThread(function()
    while true do
        local ApoloDev = 1000

        if WallAtivado then
            local PlayersData = GetActivePlayers()

            for ThisIgnore, ThisPlayerId in ipairs(PlayersData) do
                local ThisSourceServerID = GetPlayerServerId(ThisPlayerId)
                local ThisPedId = GetPlayerPed(ThisPlayerId)
                local ThisCoords = GetEntityCoords(ThisPedId)
                local Distance = #(ThisCoords - GetEntityCoords(PlayerPedId()))

                if Distance <= DistanciaConfig then
                    ApoloDev = 5

                    local ThisName = ServerInfos[ThisSourceServerID] and ServerInfos[ThisSourceServerID]["Nome"] or GetPlayerName(ThisPlayerId)
                    local ThisIdentifier = ServerInfos[ThisSourceServerID] and ServerInfos[ThisSourceServerID]["Identifier"] or ThisSourceServerID
                    local ThisGroup = ServerInfos[ThisSourceServerID] and ServerInfos[ThisSourceServerID]["Group"] or "Cidadão"
                    local ThisStaff = ServerInfos[ThisSourceServerID] and ServerInfos[ThisSourceServerID]["Status"] and "\n~g~WALL ON" or ""
                    local ThisHealth = GetEntityHealth(ThisPedId)
                    local ThisHealthRounded = math.floor(((ThisHealth - 100) / (VidaMaximaConfig - 100)) * 100)
                    local ThisArmour = GetPedArmour(ThisPedId)

                    Draw3DText(x, y + 1.0, z, "~w~"..ThisName.." | ~g~"..ThisGroup.."\nVida: ~"..(ThisHealthRounded >= 30 and 'g' or 'r').."~"..ThisHealthRounded.." | Colete: ~b~"..ThisArmour.." "..ThisStaff.."")
                end
            end
        end

        Wait(ApoloDev)
    end
end)

RegisterNetEvent("Staff:ReceberInfos")
AddEventHandler("Staff:ReceberInfos", function(Status, Data)
    WallAtivado = Status
    ServerInfos = Data
end)

function Draw3DText(x, y, z, text)
	local OnScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

	if OnScreen then
		SetTextScale(0.35, 0.35)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 215)
		SetTextDropShadow(0, 0, 0, 55)
		SetTextEdge(0, 0, 0, 150)
		SetTextDropShadow()
		SetTextOutline()
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
		DrawText(_x,_y)
	end
end

-- Apolo Dev - Wall System --