---@diagnostic disable: duplicate-set-field
if GetResourceState('Renewed-Banking') == 'missing' then return end
Managment = Managment or {}

---This will return a table with account details
---@param account string
---@return table
Managment.GetAccountMoney = function(account)
    return exports['Renewed-Banking']:getAccountMoney(account)
end

---This will add money to the specified account of the passed amount
---@param account string
---@param amount number
---@param _ string
---@return boolean
Managment.AddAccountMoney = function(account, amount, _)
    return exports['Renewed-Banking']:addAccountMoney(account, amount)
end

---This will remove money from the specified account of the passed amount
---@param account string
---@param amount number
---@param _ string
---@return boolean
Managment.RemoveAccountMoney = function(account, amount, _)
    return exports['Renewed-Banking']:removeAccountMoney(account, amount)
end

return Managment