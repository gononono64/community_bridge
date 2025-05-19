local resourceName = "okokPhone"
if GetResourceState(resourceName) == 'missing' then return end
Phone = Phone or {}

---comment
---@param email string
---@param title string
---@param message string
---@return boolean
---@diagnostic disable-next-line: duplicate-set-field
Phone.SendEmail = function(email, title, message)
    --<-- TODO swap to internal callback system
    local success = lib.callback.await('community_bridge:Callback:okokPhone:sendEmail', false, email, title, message) --[[ @as boolean ]]
    return success
end

return Phone