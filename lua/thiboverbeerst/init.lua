
-- Set <space> as the leader key
-- -- See `:help mapleader`
-- --  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- Load Neovim features using plugin manager of choice
-- Current plugin manager: lazy.nvim
require("thiboverbeerst.lazy")

-- Load settins: options, keymaps, autocommands
require("thiboverbeerst.settings")
