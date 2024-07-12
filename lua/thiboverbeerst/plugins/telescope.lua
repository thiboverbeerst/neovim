
-- Telescope highly extendable fuzzy finder over lists.
-- https://github.com/nvim-telescope/telescope.nvim

return {
  {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
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

