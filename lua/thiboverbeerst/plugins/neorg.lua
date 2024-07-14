
if false then return {} end

-- neorg needs a colorscheme with treesitter support

return {
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    lazy = false, -- -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = true,
    opts = {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.export"] = {}, -- Exports .norg file into any other supported filetype
        ["core.export.markdown"] = {}, -- Interface for `core.export` to allow exporting to markdown
      }
    },
    dependencies = {
       "pysan3/pathlib.nvim",
	"MunifTanjim/nui.nvim",
	"nvim-neotest/nvim-nio",
	"nvim-neorg/lua-utils.nvim",
	"nvim-lua/plenary.nvim"
    }
  },
}

