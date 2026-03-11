-- Apolo Dev --

StaffInfos = {}

RegisterCommand(Config["NomeDoComando"], function(Source,Args,RawCMD)
    local Source = Source

    local Status = false
    local DataPlayers = {}
    
    if Config["VerificarAcesso"](Source) then
        DataPlayers = Config["RetornarDados"]()
        StaffInfos[Source] = {["Status"] = true}
    end

    TriggerClientEvent("Staff:ReceberInfos", Source, Status, DataPlayers)
end)