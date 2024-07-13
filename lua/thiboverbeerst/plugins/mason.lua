
--  Portable package manager for Neovim that runs everywhere Neovim runs.
--  https://github.com/williamboman/mason.nvim


-- [ LSP Servers]
-- These provide language-specific features like auto-completion, go-to-definition, and linting directly within Neovim.
-- Managed by Mason, specifically through the mason-lspconfig plugin.
-- These servers integrate tightly with Neovim via nvim-lspconfig and are invoked automatically when you open a file of the corresponding language.
-- list of lsp servers with mason:
-- https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
local ensure_installed = {
    "clangd", -- C++
    "jsonls", -- JSON
    "texlab", -- LaTeX
    "marksman", -- Markdown
    "pyright", -- Python
    "lua_ls", -- Lua
    "tsserver", -- TypeScript and JavaScript
    "eslint", -- ESLint
    "matlab_ls", -- Matlab
    "lemminx", -- XML
    "yamlls", -- YAML
    "cssls", -- CSS
    "html", -- HTML
}


-- [ Tools ]
-- These are formatters, linters, debuggers, and other utilities.
-- They can be installed and managed by Mason, and they are typically available on your system's PATH.
-- Mason ensures these tools are installed and up-to-date, but you might use them in your terminal or through specific Neovim plugins that call these tools when needed.

local tools = {
    -- Formatter: to ensure consistent style
    "isort", -- Python
    "prettier", -- JavaScript
    "stylua", -- Lua
    -- Linter: to catch syntax errors, potential bugs, and enforce code quality rules.
    "eslint_d", -- JavaScript
    "selene", -- Lua
    "yamllint", -- YAML
    "ruff", -- Python
    -- DAP: debuggers
    "debugpy", -- Python
    "codelldb", -- LLDB-based debugger for various languages (C, C++, Objective-C)
}

return {
  {
    "williamboman/mason.nvim",
    lazy = true,
    cmd = "Mason",
    dependencies = {
      { "williamboman/mason-lspconfig.nvim", module = "mason" },
    },
    config = function()
      require("mason").setup()
  
      -- ensure tools are installed
      local mr = require("mason-registry")
      local function install_ensured()
        for _, tool in ipairs(tools) do
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
      require("mason-lspconfig").setup({
        ensure_installed = ensure_installed 
      })
    end,
  },
  -- bridges Mason with the `lspconfig` plugin
  { 
    "williamboman/mason-lspconfig.nvim" 
  },
}
