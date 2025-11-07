add({ source = 'nvim-mini/mini.clue', checkout = 'stable' })

require("mini.clue").setup({
  triggers = {
    { mode = 'n', keys = '<Leader>' }, -- Leader
    { mode = 'n', keys = 'g' }, -- LSP
  }
})
