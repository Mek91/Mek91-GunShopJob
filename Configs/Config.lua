---------------------------------------------------------------------------------------------------------------------------
Mek91_GSJ = {}
---------------------------------------------------------------------------------------------------------------------------
Mek91_GSJ.Core = exports['qb-core']:GetCoreObject()
---------------------------------------------------------------------------------------------------------------------------
Mek91_GSJ.Language = EN -- | TR | EN | Select Language.
---------------------------------------------------------------------------------------------------------------------------
Mek91_GSJ.Items = {
    [1] = {
        name = "weapon_knife",
        price = 50000,
        amount = 1,
        info = {
            serie = "",
        },
        type = "weapon",
        slot = 1,
    },
    [2] = {
        name = "weapon_pistol",
        price = 150000,
        amount = 1,
        info = {
            serie = "",
        },
        type = "weapon",
        slot = 2,
    },
}
---------------------------------------------------------------------------------------------------------------------------
Mek91_GSJ.Fields = {
    ['ExampleGunShop'] = { -- You can give any name you wish. ||| EXAMPLE |||
        Job = "examplegunshop", -- You can also open it to everyone with "any" OR Write your occupation name here!
        JobName = "Example Gun Shop", -- Name of Profession.
        JobLabel = "Example Gun Shop", -- Profession Description.
        Payment = 80, -- How much salary should he get?
        AddJob = true, -- Should it be added as a profession? /setjob "id" "stockbroker" "0"

        TargetLabel = "Example Gun Shop",
        Icon = "far fa-gun",
        TargetLocation = vector3(22.47, -1105.41, 29.8), -- If you want it to be triggered from where, write the coordinate as Vector3 here!
        TargetMinZ = 29, -- Enter the Minimum Z Height so that it can trigger This is usually the option with vector3(none, none, 34) "34" and it varies.
        TargetMaxZ = 30, -- Enter the Maximum Z Height so that it can trigger This is usually the option with vector3(none, none, 35) "35" and it varies.

        Blip = true, -- Do you want it on the map?
        BlipName = "Example Gun Shop", -- Write Blip Name!
        BlipId = 159, -- Select the Icon Id to be displayed on the map. https://docs.fivem.net/docs/game-references/blips
        BlipColorId = 10, -- Select Icon Colour. https://docs.fivem.net/docs/game-references/blips
        BlipDisplay = 4, -- Determines how the blip will appear on the map.
        BlipScale = 0.6, -- Adjusting the size of the blip.
        BlipLocation = vector2(22.47, -1105.41), -- Write as vector2() or vector3() at which location you want it to appear on the map.
    },
}
---------------------------------------------------------------------------------------------------------------------------
Mek91_GSJ.AddJob = function(Job, JobName, JobLabel, Payment)
    exports['qb-core']:AddJob(Job, 
    {
        label = JobLabel,
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = JobName,
                payment = JobLabel
            }
        }
    })
end
---------------------------------------------------------------------------------------------------------------------------
Mek91_GSJ.SetTarget = function(Job, TargetLocation, TargetLabel, Event, Type, Icon, TargetMinZ, TargetMaxZ)
    exports['qb-target']:AddBoxZone(Job, TargetLocation, 5.3, 4.0, {
        name = Job,
        debugPoly = false,
        minZ = TargetMinZ,
        maxZ = TargetMaxZ
    }, {
        options = {
            {
                type = Type, -- "client" or "server"
				event = Event, -- Trigger Event
                icon = Icon,
                label = TargetLabel,
                job = Job,
            },
        },
        distance = 2,
    })
end
---------------------------------------------------------------------------------------------------------------------------
Mek91_GSJ.OpenGunShop = function(Job)
    local SelectItems = {
        label = Mek91_GSJ.Language.Main.Title .. ": " .. Job,
        slots = 30,
        items = Mek91_GSJ.Items
    }

    TriggerServerEvent("inventory:server:OpenInventory", "shop", Job, SelectItems)
end
---------------------------------------------------------------------------------------------------------------------------
Mek91_GSJ.GetPlayerJob = function(PlayerId, Core)
    local Player = Core.Functions.GetPlayerData()

    return Player.job.name
end
---------------------------------------------------------------------------------------------------------------------------
-- VERSION: 1.0.0
-- Discord: mek91
-- Github:  https://github.com/Mek91
-- YouTube: https://www.youtube.com/@mek91
---------------------------------------------------------------------------------------------------------------------------
-- LIBS: qb-core | qb-target | lj-inventory
---------------------------------------------------------------------------------------------------------------------------