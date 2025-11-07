add({ source = "echasnovski/mini.comment", depends = { "JoosepAlviste/nvim-ts-context-commentstring" } })

later(function()
  require('ts_context_commentstring').setup {
      enable_autocmd = false,
  }
  require("mini.comment").setup {
      -- tsx, jsx, html , svelte comment support
      options = {
          custom_commentstring = function()
              return require('ts_context_commentstring.internal').calculate_commentstring({ key =
                  'commentstring' })
                  or vim.bo.commentstring
          end,
      },
  }
end)
