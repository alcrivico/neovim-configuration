---@diagnostic disable: missing-fields

local cmp = require('cmp')
local luasnip = require('luasnip')
local cmp_autopairs = require "nvim-autopairs.completion.cmp"

local M = {}

function M.setup()
  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },

    mapping = {
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<S-e>"] = cmp.mapping.abort(),
      ["<S-j>"] = cmp.mapping(
        function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.choice_active() then
            luasnip.change_choice(1)
          else
            fallback()
          end
        end, { "i", "s" }
      ),
      ["<S-k>"] = cmp.mapping.select_prev_item(),
      ["<tab>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      ["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      ["<c-space>"] = cmp.mapping.complete(),
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "path" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "copilot" },
    },
  })

  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })

  vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

  -- Configuration for a speccific filetype
  cmp.setup.filetype('gitcommit',
    {
      sources = cmp.config.sources({
        { name = 'git' },
      },
      {
        { name = 'buffer' },
      })
    })
  -- use buffer source for '/' and '?' (if you were `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    },
  })
  -- use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore)
  cmp.setup.cmdline(':',
  {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
    {
      { name = 'path' }
    },
    {
      { name = 'cmdline' }
    })
  })
end

return M
