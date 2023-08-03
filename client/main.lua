local VORPcore = {}

TriggerEvent("getCore", function(core)
    VORPcore = core
end)

local headerShown = false
local sendData = nil
-- Functions



local function openMenu(data)
    if not data or not next(data) then return end

    for _,v in pairs(data) do
        if v["icon"] then
            local img = "vorp_inventory/html/img/items"
            v["icon"] = img.."/"..v["icon"]..".png"
            -- print(v["icon"])
        end
    end
    SetNuiFocus(true, true)
    headerShown = false
    sendData = data
    SendNUIMessage({
        action = 'OPEN_MENU',
        data = table.clone(data)
    })
end

local function closeMenu()
    sendData = nil
    headerShown = false
    SetNuiFocus(false)
    SendNUIMessage({
        action = 'CLOSE_MENU'
    })
end

local function showHeader(data)
    if not data or not next(data) then return end
    for _,v in pairs(data) do
        if v["icon"] then
            local img = "vorp_inventory/html/img/items"
            v["icon"] = img.."/"..v["icon"]..".png"
            -- print(v["icon"])
        end
    end
    headerShown = true
    sendData = data
    SendNUIMessage({
        action = 'SHOW_HEADER',
        data = table.clone(data)
    })
end

-- Events

RegisterNetEvent('fx-menu:client:openMenu', function(data)
    openMenu(data)
end)

RegisterNetEvent('fx-menu:client:closeMenu', function()
    closeMenu()
end)

-- NUI Callbacks

RegisterNUICallback('clickedButton', function(option)
    if headerShown then headerShown = false end
    PlaySoundFrontend("SELECT", "RDRO_Character_Creator_Sounds", true, 0)
    SetNuiFocus(false)
    if sendData then
        local data = sendData[tonumber(option)]
        sendData = nil
        if data then
            if data.params.event then
                if data.params.isServer then
                    TriggerServerEvent(data.params.event, data.params.args)
                elseif data.params.isCommand then
                    ExecuteCommand(data.params.event)
                elseif data.params.isRSGCommand then
                    TriggerServerEvent('Grand:CallCommand', data.params.event, data.params.args)
                elseif data.params.isAction then
                    data.params.event(data.params.args)
                else
                    TriggerEvent(data.params.event, data.params.args)
                end
            end
        end
    end
end)

RegisterNUICallback('closeMenu', function()
    headerShown = false
    sendData = nil
    SetNuiFocus(false)
end)

-- Command and Keymapping

RegisterCommand('+playerfocus', function()
    if headerShown then
        SetNuiFocus(true, true)
    end
end)

RegisterKeyMapping('+playerFocus', 'Give Menu Focus', 'keyboard', 'LMENU')

-- Exports

exports('openMenu', openMenu)
exports('closeMenu', closeMenu)
exports('showHeader', showHeader)
