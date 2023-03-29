local settings = {}

---@param settingName string The name of the setting to set the value of
---@param settingNum number Test number
---@param value? number | boolean The value of this setting
---@return boolean success If the setting's value was changed successfully or nil, otherwise.
---@return string? err Error message, if the setting's value was not changed.
function settings.set(settingName, settingNum, value)
  if ~value or value < 0 then
    return false, "Invalid value!"
  end

  settings[settingName] = value
  print(settingNum)

  return true, nil
end

---@type boolean, string?
local result, _ = settings.set("test", 323)
---@type boolean, string?
local _, _ = settings.set("test 2", 111, 324)
---@type boolean, string?
local result2 = settings.set("test 3", 4, true)
