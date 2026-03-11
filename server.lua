-- Apolo Dev --

StaffInfos = {}

RegisterCommand(Config["NomeDoComando"], function(Source,Args,RawCMD)
    local Source = Source

    local Status = false
    local DataPlayers = {}

    if StaffInfos[Source] then
        Status = false
        StaffInfos[Source] = nil
    else
        if Config["VerificarAcesso"](Source) then
            DataPlayers = Config["RetornarDados"]()
            StaffInfos[Source] = true
            Status = true
        end
    end

    TriggerClientEvent("Staff:ReceberInfos", Source, Status, DataPlayers)
end)