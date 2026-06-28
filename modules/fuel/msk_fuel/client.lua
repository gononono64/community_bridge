---@diagnostic disable: duplicate-set-field
local resourceName = "msk_fuel"
if GetResourceState(resourceName) == 'missing' then return end
Fuel = Fuel or {}

---@description Returns the name of the active fuel resource.
---@return string
Fuel.GetResourceName = function()
    return resourceName
end

---@description Returns the current fuel level of a vehicle.
---@param vehicle number The vehicle entity handle.
---@return number The vehicle fuel level.
Fuel.GetFuel = function(vehicle)
    if not DoesEntityExist(vehicle) then return 0.0 end
    return exports.msk_fuel:GetVehicleFuel(vehicle)
end

---@description Sets the fuel level of a vehicle.
---@param vehicle number The vehicle entity handle.
---@param fuel number The fuel level to assign.
---@param type? string The fuel type, used only in ti_fuel / msk_fuel. (default: nil)
---@return nil
Fuel.SetFuel = function(vehicle, fuel, type)
    if not DoesEntityExist(vehicle) then return end
    exports.msk_fuel:SetVehicleFuel(vehicle, fuel)
    if type then
        exports.msk_fuel:SetVehicleFuelType(vehicle, type)
    end
end

return Fuel
