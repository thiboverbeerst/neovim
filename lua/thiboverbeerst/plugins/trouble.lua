
-- A pretty list for showing diagnostics, references, telescope results, quickfix and location lists to help you solve all the trouble your code is causing.
-- https://github.com/folke/trouble.nvim

return {
  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup({
        icons = false,
      })
    end
  },
}
