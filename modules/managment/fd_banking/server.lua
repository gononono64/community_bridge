---@diagnostic disable: duplicate-set-field
if GetResourceState('fd_banking') == 'missing' then return end
Managment = Managment or {}

local fd_banking = exports['fd_banking']

---This will return a table with account details
---@param account string
---@return table
Managment.GetAccountMoney = function(account)
    return fd_banking:GetAccount(account)
end

---This will add money to the specified account of the passed amount
---@param account string
---@param amount number
---@param reason string
---@return boolean
Managment.AddAccountMoney = function(account, amount, reason)
    return fd_banking:AddMoney(account, amount, reason)
end

---This will remove money from the specified account of the passed amount
---@param account string
---@param amount number
---@param reason string
---@return boolean
Managment.RemoveAccountMoney = function(account, amount, reason)
    return fd_banking:removeAccountMoney(account, amount, reason)
end

return Managment