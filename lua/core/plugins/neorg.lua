
if false then return {} end

return {
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    lazy = false, -- -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = true,
    opts = {},
  },
  -- A Collection of Lua Utilities for Neovim
  -- https://github.com/nvim-neorg/lua-utils.nvim
  { "nvim-neorg/lua-utils.nvim" }, 
}
