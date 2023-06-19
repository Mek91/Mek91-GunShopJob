local Core = Mek91_GSJ.Core
local StringPrefix = "Mek91GSJ: "
local Event = "Mek91GSJ:Server:OpenGSJ"
local Type = "server"
local PlayerId = 0

Citizen.CreateThread(function()
    for key, Field in pairs(Mek91_GSJ.Fields) do
        Mek91_GSJ.SetTarget(Field.Job, Field.TargetLocation, Field.TargetLabel, Event, Type, Field.Icon, Field.TargetMinZ, Field.TargetMaxZ)
    
        if Field.Blip then
            Mek91GSJAddBlip(Field.BlipLocation, Field.BlipId, Field.BlipColorId, Field.BlipName, Field.BlipDisplay, Field.BlipScale)
        end
    end
end)

RegisterNetEvent("Mek91GSJ:Client:OpenGSJ", function(PlyrId)
    PlayerId = PlyrId
    local PlayerJob = Mek91_GSJ.GetPlayerJob(PlayerId, Core)
    
    if Mek91GSJGetJob(PlayerJob) then
        Mek91_GSJ.OpenGunShop(PlayerJob)
    else
        Core.Functions.Notify(Mek91_GSJ.Language.Errors.JobNotFound)
    end
end)

function Mek91GSJGetJob(Job)
    local JobOkay = false

    for key, Fields in pairs(Mek91_GSJ.Fields) do
        if Fields.Job == Job then
            JobOkay = true
            break
        end
    end

    return JobOkay
end

function Mek91GSJAddBlip(BlipLocation, BlipId, BlipColorId, BlipName, BlipDisplay, BlipScale)
    local blip = AddBlipForCoord(BlipLocation.x, BlipLocation.y, 0.0)
    SetBlipSprite(blip, BlipId)
    SetBlipColour(blip, BlipColorId)
    SetBlipDisplay(blip, BlipDisplay)
    SetBlipScale(blip, BlipScale)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(BlipName)
    EndTextCommandSetBlipName(blip)
end