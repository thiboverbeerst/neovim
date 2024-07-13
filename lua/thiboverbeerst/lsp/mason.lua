
--  Portable package manager for Neovim that runs everywhere Neovim runs.
--  https://github.com/williamboman/mason.nvim

return {
  {
    "williamboman/mason.nvim",
    lazy = true,
    cmd = "Mason",
    dependencies = {
      { "williamboman/mason-lspconfig.nvim", module = "mason" },
    },
    config = function()
      -- install_root_dir = path.concat({ vim.fn.stdpath("data"), "mason" }),
      require("mason").setup()
  
      -- ensure tools (except LSPs) are installed
      local mr = require("mason-registry")
      local function install_ensured()
        for _, tool in ipairs(vim.g.config.tools) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end
      if mr.refresh then
        mr.refresh(install_ensured)
      else
        install_ensured()
      end
  
      -- install LSPs
      require("mason-lspconfig").setup({ ensure_installed = vim.g.config.lsp_servers })
    end,
  },
  -- bridges Mason with the `lspconfig` plugin
  { 
    "williamboman/mason-lspconfig.nvim" 
  },
}
