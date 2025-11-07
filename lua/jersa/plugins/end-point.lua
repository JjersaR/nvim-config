add({ source = "zerochae/endpoint.nvim" })

later(function()
  require("endpoint").setup({
    picker = { type = "snacks" }
  })

  vim.keymap.set("n", "<Leader>s", "", { desc = "Spring Boot", remap = true })
  vim.keymap.set("n", "<Leader>se", ":Endpoint<CR>", { desc = "[E]nd Points", remap = true })
end)
