return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local emmet_capabilities = vim.lsp.protocol.make_client_capabilities()
      emmet_capabilities.textDocument.completion.completionItem.snippetSupport = true
      local lspconfig = require("lspconfig")
      -- lua
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      -- html
      lspconfig.html.setup({
        capabilities = emmet_capabilities,
      })
      -- css
      lspconfig.cssls.setup({
        capabilities = emmet_capabilities,
      })
      -- docker
      lspconfig.docker_compose_language_service.setup{}
      -- ts, js, html, css
      lspconfig.ts_ls.setup{}
      -- python
      lspconfig.pyright.setup{}
      -- bash
      lspconfig.bashls.setup{}
      -- SQL
      lspconfig.sqlls.setup{}
      vim.keymap.set("n", "I", vim.lsp.buf.hover, { desc = "Get information about hoovered" })
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Get definition" })
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Get references" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Get code actions" })
    end,
  },
}
