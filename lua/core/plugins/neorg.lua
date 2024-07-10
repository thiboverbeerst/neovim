
if false then return {} end

return {
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    ft = 'norg', -- lazy load on filetype
    version = "*", -- Pin Neorg to the latest stable release
    config = true,
    opts = {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
      }
    },
  },
  -- A Collection of Lua Utilities for Neovim
  -- https://github.com/nvim-neorg/lua-utils.nvim
  { "nvim-neorg/lua-utils.nvim" }, 
}
