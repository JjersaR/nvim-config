add({ source = "voldikss/vim-floaterm" })

vim.g.floaterm_wintype = "float"
vim.g.floaterm_height = 0.9
vim.g.floaterm_width = 0.9
vim.g.floaterm_autoclose = 1
vim.g.floaterm_title = "─($1/$2)──"
vim.g.floaterm_borderchars = "─│─│╭╮╯╰"

-- Terminal keymaps (Floaterm)
vim.keymap.set("n", "<C-t>", "<cmd>FloatermNew --wintype=split --height=0.4<cr>", {
  desc = "Terminal in split mode",
  silent = true,
})

vim.keymap.set({ "n", "t" }, "<F8>", "<cmd>FloatermKill<cr>", {
  desc = "Kill terminal",
  silent = true,
})

vim.keymap.set({ "n", "t" }, "<F9>", "<cmd>FloatermNew<cr>", {
  desc = "New terminal",
  silent = true,
})

vim.keymap.set({ "n", "t" }, "<F10>", "<cmd>FloatermToggle<cr>", {
  desc = "Toggle terminal",
  silent = true,
})

vim.keymap.set({ "n", "t" }, "<F11>", "<cmd>FloatermPrev<cr>", {
  desc = "Prev terminal",
  silent = true,
})

vim.keymap.set({ "n", "t" }, "<F12>", "<cmd>FloatermNext<cr>", {
  desc = "Next terminal",
  silent = true,
})

vim.keymap.set("n", "<Leader>gg", "<cmd>FloatermNew lazygit<cr>", {
  desc = "LazyGit",
  silent = true,
})
