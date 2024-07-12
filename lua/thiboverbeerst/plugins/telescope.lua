local funcs = require("thiboverbeerst.utils.functions")

-- [ Why configure plugin in a core.plugins file? ]
-- When settings are closer to the plugin it's less prone to errors
-- For eg, settings aren't loaded when plugin is disabled


local function neovim_conf_files()
  return "lua require('telescope.builtin').find_files({ cwd = require('lazy.core.config').options.root })"
end


-- Using git files will prevent searching inside dir like node_modules, ...
local function project_files()
  local path = vim.loop.cwd() .. "/.git"
  if funcs.path_exists(path) then
    return "lua require('telescope.builtin').git_files({ show_untracked = true })"
  else
    return "Telescope find_files"
  end
end


-- [1] Telescope highly extendable fuzzy finder over lists.
-- https://github.com/nvim-telescope/telescope.nvim

-- [2] telescope-file-browser.nvim is a file browser extension for telescope.nvim. 
-- It supports synchronized creation, deletion, renaming, and moving of files and folders
-- https://github.com/nvim-telescope/telescope-file-browser.nvim

return {
  {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      -- files
      { "<leader>ff", "<cmd>" .. project_files() .. "<cr>", desc = "Find File" },
      { "<leader>fF", "<cmd>Telescope find_files<cr>", desc = "Find File (ignore git)" },
      { "<leader>fp", "<cmd>" .. neovim_conf_files() .. "<cr>", desc = "Find Neovim Config File" },
      -- search stuff
      { "<leader>ss", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
	initial_mode = "normal"
      }, 
    },
  },
 }

