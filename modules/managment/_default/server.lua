---@diagnostic disable: duplicate-set-field
Managment = Managment or {}

---This will return a table with account details
---@param account string
---@return table
Managment.GetAccountMoney = function(account)
    return {}, print("The resource you are using does not support this function.")
end

---This will add money to the specified account of the passed amount
---@param account string
---@param amount number
---@param reason string
---@return boolean
Managment.AddAccountMoney = function(account, amount, reason)
    return false, print("The resource you are using does not support this function.")
end

---This will remove money from the specified account of the passed amount
---@param account string
---@param amount number
---@param reason string
---@return boolean
Managment.RemoveAccountMoney = function(account, amount, reason)
    return false, print("The resource you are using does not support this function.")
end

return Managment