-- Apolo Dev --

local WallAtivado = false

Citizen.CreateThread(function()
    while true do
        local ApoloDev = 1000

        if WallAtivado then
            ApoloDev = 5

            
        end

        Wait(ApoloDev)
    end
end)