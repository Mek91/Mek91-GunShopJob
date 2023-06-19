local Core = Mek91_GSJ.Core
local StringPrefix = "Mek91GSJ: "

Citizen.CreateThread(function()
    for key, Add in pairs(Mek91_GSJ.Fields) do
        Mek91_GSJ.AddJob(Add.Job, Add.JobName, Add.JobLabel, Add.Payment)
    end
end)

RegisterServerEvent("Mek91GSJ:Server:OpenGSJ", function()
    PlayerId = source
    TriggerClientEvent("Mek91GSJ:Client:OpenGSJ", PlayerId, PlayerId)
end)