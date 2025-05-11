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
    'mrcjkb/rustaceanvim',
    version = '^6',
    lazy = true,
    ["rust-analyzer"] = {
    }
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
      lspconfig.lua_ls.setup {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              checkThirdParty = false,
              library = {
                [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                [vim.fn.stdpath "config" .. "/lua"] = true,
              },
            },
          },
        }
      }
			-- html
			lspconfig.html.setup({
				capabilities = emmet_capabilities,
			})
			-- css
			lspconfig.cssls.setup({
				capabilities = emmet_capabilities,
			})
			-- docker
			lspconfig.docker_compose_language_service.setup({})
			-- ts, js, html, css
			-- lspconfig.ts_ls.setup({})
      -- Vue
      lspconfig.volar.setup {
        -- add filetypes for typescript, javascript and vue
        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
        init_options = {
          vue = {
            -- disable hybrid mode
            hybridMode = false,
          },
        },
      }
			-- python
			lspconfig.pyright.setup({})
			-- bash
			lspconfig.bashls.setup({})
			-- SQL
			lspconfig.sqlls.setup({
        config = {
          cmd = { 'sql-language-server', 'up', '--method', 'stdio' },
          filetypes = { 'sql', 'mysql' },
          root_dir = lspconfig.util.root_pattern '.sqllsrc.json',
          settings = {}
        }
      })
      -- Rust
      lspconfig.rust_analyzer.setup({
        diagnostics = {
          enable = true,
          disabled = { 'unresolved-proc-macro', 'unresolved-macro-call' },
        },
        cargo = {
          allFeatures = true,
        }
      })
			-- Go
			lspconfig.gopls.setup({
				settings = {
					gopls = {
						gofumpt = true,
						completeUnimported = true,
						importShortcut = "Definition",
						usePlaceholders = true,
						analyses = {
							unusedparams = true,
						},
						hints = {
							assignVariableTypes = true,
							compositeLiteralFields = true,
							compositeLiteralTypes = true,
							constantValues = true,
							functionTypeParameters = true,
							parameterNames = true,
							rangeVariableTypes = true,
						},
						codelenses = {
							generate = true,
							gc_details = true,
							regenerate_cgo = true,
							tidy = true,
							upgrade_dependency = true,
							vendor = true,
						},
						staticcheck = true,
						matcher = "Fuzzy",
						experimentalPostfixCompletions = true,
						diagnosticsDelay = "500ms",
						symbolMatcher = "fuzzy",
						buildFlags = { "-tags=integration" },
						env = {
							GOFLAGS = "-tags=integration",
						},
					},
				},
			})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Get definition" })
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Get references" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Get code actions" })
		end,
	},
}
