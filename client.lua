-- Apolo Dev --

local WallAtivado = false
local ServerInfos = {} -- Adicionado para quando quiser trazer informações para o client-side do wall

Citizen.CreateThread(function()
    while true do
        local ApoloDev = 1000

        if WallAtivado then
            ApoloDev = 5

            
        end

        Wait(ApoloDev)
    end
end)

RegisterNetEvent("Staff:ReceberInfos")
AddEventHandler("Staff:ReceberInfos", function(Data)
    ServerInfos = Data
end)