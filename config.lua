Config = {}

Config["NomeDoComando"] = "wall" -- Esse é o comando pra ativar o wall

Config["VerificarAcesso"] = function(Source)
    local Acesso = true -- true ou false

    -- Aqui faz a verificação do acesso você pode fazer o que quiser
    if Source then
    end

    return Acesso
end

Config["RetornarDados"] = function()
    local Data = {}
    local AllPlayers = GetPlayers()

    for ThisIgnore, ThisSource in ipairs(AllPlayers) do
        Data[ThisSource] = {Nome = GetPlayerName(ThisSource), Identifier = ThisSource, Group = "Cidadão", Status = StaffInfos[ThisSource]["Status"]}
    end

    return Data
end