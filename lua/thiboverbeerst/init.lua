
-- Set <space> as the leader key
-- -- See `:help mapleader`
-- --  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
-- NOTE: Must happen before plugins are loaded
vim.g.have_nerd_font = true

-- Netrw file browser
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- Load Neovim features using plugin manager of choice
-- Current plugin manager: lazy.nvim
require("thiboverbeerst.lazy")

-- Load settins: options, keymaps, autocommands
require("thiboverbeerst.settings")

