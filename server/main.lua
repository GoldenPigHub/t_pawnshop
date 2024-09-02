--- SELL ---

lib.locale()

RegisterServerEvent("t_sellThings:done")
AddEventHandler('t_sellThings:done', function ()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local item = Config.item
    local money = xPlayer.getInventoryItem(item) 
    

    if money.count >= Config.amount then
        xPlayer.removeInventoryItem(Config.item, money.count)
        xPlayer.addMoney(money.count * Config.tax)
    else
        TriggerClientEvent('pawn_error', src)
    end
end)

RegisterServerEvent("t_sellThings2:done")
AddEventHandler('t_sellThings2:done', function ()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local item2 = Config.item2
    local money = xPlayer.getInventoryItem(item2) 
    

    if money.count >= Config.amount then
        xPlayer.removeInventoryItem(Config.item2, money.count)
        xPlayer.addMoney(money.count * Config.tax)
    else
        TriggerClientEvent('pawn_error', src)
    end
end)
RegisterServerEvent("t_sellThings3:done")
AddEventHandler('t_sellThings3:done', function ()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local item3 = Config.item3
    local money = xPlayer.getInventoryItem(item3) 
    

    if money.count >= Config.amount then
        xPlayer.removeInventoryItem(Config.item3, money.count)
        xPlayer.addMoney(money.count * Config.tax)
    else
        TriggerClientEvent('pawn_error', src)
    end
end)

--- BUY ---

RegisterServerEvent("t_buyThings:done")
AddEventHandler('t_buyThings:done', function ()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local money = xPlayer.getInventoryItem('money') 

    if money.count >= Config.buyItemPrice then
        xPlayer.removeInventoryItem(Config.money, Config.buyItemPrice)
        xPlayer.addInventoryItem('phone')
    else
        TriggerClientEvent('pawn_error', src)
    end
end)

RegisterServerEvent("t_buyThings2:done")
AddEventHandler('t_buyThings2:done', function ()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local money = xPlayer.getInventoryItem('money') 

    if money.count >= Config.buyItemPrice then
        xPlayer.removeInventoryItem(Config.money, Config.buyItemPrice2)
        xPlayer.addInventoryItem('radio')
    else
        TriggerClientEvent('pawn_error', src)
    end
end)