local M = {}

---notify
---@param message string
---@param level integer
---@param title string
M.notify = function(message, level, title)
  local notify_options = {
    title = title,
    timeout = 2000,
  }
  vim.api.nvim_notify(message, level, notify_options)
end

-- This function safely navigates through a nested configuration table to retrieve a value. 
-- It takes a configuration table (config) and a variable number of additional arguments (...) representing
-- the path to the desired value within the table. It returns nil if any part of the path does not exist.
M.safe_nested_config = function(config, ...)
  local elements = { ... }
  local node = config
  for i = 1, #elements do
    node = node[elements[i]]
    if node == nil then
      return nil
    end
  end
  return node
end

--- Check if path exists
M.path_exists = function(path)
  return vim.loop.fs_stat(path)
end

return M
