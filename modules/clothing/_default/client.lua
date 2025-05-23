--[[This module is incomplete]]--

Clothing = Clothing or {}

ClothingBackup = {}
Callback = Callback or Require("lib/utility/shared/callbacks.lua")

function Clothing.IsMale()
    local ped = PlayerPedId()
    if not ped then return end
    if GetEntityModel(ped) == `mp_m_freemode_01` then
        return true
    end
    return false
end

---Get the skin data of a ped
---@param entity number
---@return table
function Clothing.GetAppearance(entity)
    if not entity and not DoesEntityExist(entity) then return end
    local model = GetEntityModel(entity)
    local skinData = { model = model, components = {}, props = {} }
    for i = 0, 11 do
        skinData.components[i] = { component_id = i, GetPedDrawableVariation(entity, i), GetPedTextureVariation(entity, i) }
    end
    for i = 0, 13 do
        skinData.props[i] = { prop_id = i, GetPedPropIndex(entity, i), GetPedPropTextureIndex(entity, i) }
    end
    return skinData
end

Callback.Register('community_bridge:cb:GetAppearance', function()
    local ped = PlayerPedId()
    if not ped or not DoesEntityExist(ped) then return end
    local skinData = Clothing.GetAppearance(ped)
    return skinData
end)

---Apply skin data to a ped
---@param entity number
---@param skinData table
---@return boolean
function Clothing.SetAppearance(entity, skinData)
    for k, v in pairs(skinData.components or {}) do
        if v.component_id then
            SetPedComponentVariation(entity, v.component_id, v.drawable, v.texture, 0)
        end
    end
    for k, v in pairs(skinData.props or {}) do
        if v.prop_id then
            SetPedPropIndex(entity, v.prop_id, v.drawable, v.texture, 0)
        end
    end
    return true
end

---This will return the peds components to the previously stored components
---@return boolean
Clothing.RestoreAppearance = function(entity)
    Clothing.SetAppearance(entity, ClothingBackup)
    return true
end

Clothing.UpdateAppearanceBackup = function(data)
    ClothingBackup = data
end

RegisterNetEvent('community_bridge:client:SetAppearance', function(data)
    Clothing.SetAppearance(PlayerPedId(), data)
end)

RegisterNetEvent('community_bridge:client:GetAppearance', function()
    Clothing.GetAppearance(PlayerPedId())
end)

RegisterNetEvent('community_bridge:client:RestoreAppearance', function()
    Clothing.RestoreAppearance(PlayerPedId())
end)

return Clothing