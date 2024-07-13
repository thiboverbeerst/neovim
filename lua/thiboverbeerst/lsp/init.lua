
return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "onsails/lspkind-nvim" },
      { "folke/neoconf.nvim", config = true, ft = "lua" }, -- must be loaded before lsp
    },
    config = function()
      require("core.plugins.lsp.lsp")
    end,
  },
}
