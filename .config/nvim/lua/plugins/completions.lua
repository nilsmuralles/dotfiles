return {
  {
    "windwp/nvim-autopairs",
    opts = {
      fast_wrap = {},
      disable_filetype = { "TelescopePrompt", "vim" },
    },
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)

      -- setup cmp for autopairs
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
  {
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      -- vscode format
      require("luasnip.loaders.from_vscode").lazy_load({ exclude = vim.g.vscode_snippets_exclude or {} })
      require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.g.vscode_snippets_path or "" })

      -- snipmate format
      require("luasnip.loaders.from_snipmate").load()
      require("luasnip.loaders.from_snipmate").lazy_load({ paths = vim.g.snipmate_snippets_path or "" })

      -- lua format
      require("luasnip.loaders.from_lua").load()
      require("luasnip.loaders.from_lua").lazy_load({ paths = vim.g.lua_snippets_path or "" })

      vim.api.nvim_create_autocmd("InsertLeave", {
        callback = function()
          if
              require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
              and not require("luasnip").session.jump_active
          then
            require("luasnip").unlink_current()
          end
        end,
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()
      local icons = {
        Text = "󰦨 ",
        Field = "󰽐 ",
        Variable = " ",
        Function = "󰆧 ",
        Class = " ";
        Snippet = " ",
        Keyword = " ",
        Property = " ",
        Unit = "󰆙 ",
        Color = " ",
        Value = " ",
        Array = " ",
        Boolean = " ",
        Constant = " ",
        Event = " ",
        File = " ",
        Interface = " ",
        Method = " ",
      }

      cmp.setup({
        completion = { completeopt = "menu,menuone" },

        snippet = { -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },

        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif require("luasnip").expand_or_jumpable() then
              require("luasnip").expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif require("luasnip").jumpable(-1) then
              require("luasnip").jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "look" },
          { name = "nvim_lua" },
          { name = "path" },
        },
        formatting = {
          format = function(_, vim_item)
            vim_item.kind = (icons[vim_item.kind] or "Foo") .. " " .. vim_item.kind
            return vim_item
          end,
        },
      })
    end,
  },
}
