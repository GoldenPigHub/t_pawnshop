lib.locale()

------------------------
----------START---------
------------------------
Citizen.CreateThread(function ()
    if Config.blip == true then
        blipp = CreateBlip(Config.blipc.x, Config.blipc.y, Config.blipc.z, Config.blipSprite, 46, Config.blipName)
    end
    SpawnNPC1()
end)

------------------------
-------BLIP CREATE------
------------------------

function CreateBlip(x, y, z, sprite, color, name)
    local blip = AddBlipForCoord(x, y, z)
    SetBlipSprite(blip, sprite)
    SetBlipColour(blip, color)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(name)
    EndTextCommandSetBlipName(blip)
    SetBlipDisplay(blip, 6)
    return blip
end


------------------------
-------SPAWN-NPC--------
------------------------

function SpawnNPC1()
    local peds = {
        { type=4, model=Config.npc}
    }

    for k, v in pairs(peds) do
        local hash = GetHashKey(v.model)
        RequestModel(hash)

        while not HasModelLoaded(hash) do
            Citizen.Wait(1)
        end

        --- SPAWN NPC---
        startNPC = CreatePed(v.type, hash, Config.blipc.x, Config.blipc.y, Config.blipc.z -1, Config.bliph, true, true)

        SetEntityInvincible(startNPC, true)
        SetEntityAsMissionEntity(startNPC, true)
        SetBlockingOfNonTemporaryEvents(startNPC, true)
        FreezeEntityPosition(startNPC, true)
    end
end

RegisterNetEvent('pawnshop_start', function (arg)
    lib.registerContext({
        id = 'pawnshop_start',
        title = locale('main_title'),
        options = {

            {
                title = locale('button1'),
                description = locale('description'),
                menu = 'sell_menu',
                icon = 'dollar'
            },
            {
                title = locale('button2'),
                description = locale('description2'),
                menu = 'buy_menu',
                icon = 'cart-shopping'
            },
        
        }
    })
    lib.registerContext({
        id = 'sell_menu',
        title = locale('main_title'),
        menu = 'pawnshop_start',
        onBack = function()
        end,
        options = {
            {
                title = locale('title'),
                description = locale('description3'),
                icon = 'fa-clock',
                event = 'pawn_money'
                
            },
            {
                title = locale('title2'),
                description = locale('description3'),
                icon = 'fa-gem',
                event = 'pawn_money2'
                
            },
            {
                title = locale('title3'),
                description = locale('description3'),
                icon = 'laptop',
                event = 'pawn_money3'
                
            },
        }
    })

    lib.registerContext({
        id = 'buy_menu',
        title = locale('main_title'),
        menu = 'pawnshop_start',
        onBack = function()
        end,
        options = {
            {
                title = locale('title_sell'),
                description = locale('price'),
                icon = 'phone',
                event = 'pawn_buy'
                
            },
            {
                title = locale('title_sell2'),
                description = locale('price2'),
                icon = 'radio',
                event = 'pawn_buy2'
                
            },
        }
    })

    lib.showContext('pawnshop_start')
end)



AddEventHandler('pawn_money', function ()

    lib.progressCircle({
        duration = 5000,
        position = 'bottom',
        useWhileDead = false,
        canCancel = false
    })
    
    sellThings()
end)

function sellThings()
    TriggerServerEvent('t_sellThings:done')
end

----

AddEventHandler('pawn_money2', function ()

    lib.progressCircle({
        duration = 5000,
        position = 'bottom',
        useWhileDead = false,
        canCancel = false
    })
    
    sellThings2()
end)

function sellThings2()
    TriggerServerEvent('t_sellThings2:done')
end

----

AddEventHandler('pawn_money3', function ()

    lib.progressCircle({
        duration = 5000,
        position = 'bottom',
        useWhileDead = false,
        canCancel = false
    })
    
    sellThings3()
end)

function sellThings3()
    TriggerServerEvent('t_sellThings3:done')
end

----

AddEventHandler('pawn_buy', function ()

    lib.progressCircle({
        duration = 5000,
        position = 'bottom',
        useWhileDead = false,
        canCancel = false
    })
    
    buyThings()
end)

function buyThings()
    TriggerServerEvent('t_buyThings:done')
end

AddEventHandler('pawn_buy2', function ()

    lib.progressCircle({
        duration = 5000,
        position = 'bottom',
        useWhileDead = false,
        canCancel = false
    })
    
    buyThings2()
end)

function buyThings2()
    TriggerServerEvent('t_buyThings2:done')
end



AddEventHandler('pawn_error')
RegisterNetEvent('pawn_error', function ()
    lib.notify({
        title = locale('error'),
        type = 'error'
    })
end)

exports.ox_target:addBoxZone({
    coords = vector3(244.5376, 374.0898, 105.7382),
    size = vec3(2, 2, 2),
    rotation = 45,
    debug = drawZones,
    options = {
        {
            name = 'pawnshop_start',
            event = 'pawnshop_start',
            icon = 'fa-solid fa-cube',
            label = 'Pawn shop',
        }
    }
})
