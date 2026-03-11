-- Apolo Dev --


RegisterCommand(Config["NomeDoComando"], function(Source,Args,RawCMD)
    local Source = Source

    local DataPlayers = {}

    TriggerClientEvent("Staff:ReceberInfos", Source, DataPlayers)
end)