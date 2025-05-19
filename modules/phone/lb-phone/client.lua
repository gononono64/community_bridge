local resourceName = "lb-phone"
if GetResourceState(resourceName) == 'missing' then return end
Phone = Phone or {}

---comment
---@param email string
---@param title string
---@param message string
---@return nil
---@diagnostic disable-next-line: duplicate-set-field
Phone.SendEmail = function(email, title, message)
    TriggerServerEvent('community_bridge:Server:genericEmail', {email = email, title = title, message = message})
end

return Phone