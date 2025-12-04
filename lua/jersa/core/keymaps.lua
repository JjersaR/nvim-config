-- better up/down
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- save file
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- better indenting
vim.keymap.set("x", "<", "<gv")
vim.keymap.set("x", ">", ">gv")

-- commenting
vim.keymap.set("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below", silent = true })
vim.keymap.set("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above", silent = true })

-- clears search highlights
vim.keymap.set("n", "<Esc>", "<cmd>nohl<CR>", { desc = "Clear search hl", silent = true })

-- tab stuff
vim.keymap.set("n", "<Leader>to", "<cmd>tabnew<CR>", { desc = "Open new Tab", silent = true }) --open new tab
vim.keymap.set("n", "<Leader>tx", "<cmd>tabclose<CR>", { desc = "Close current Tab", silent = true }) --close current tab
vim.keymap.set("n", "<TAB>", "<cmd>tabn<CR>", { desc = "Go to Next", silent = true }) --go to next
vim.keymap.set("n", "<S-TAB>", "<cmd>tabp<CR>", { desc = "Go to Pre", silent = true }) --go to pre
vim.keymap.set("n", "<Leader>tf", "<cmd>tabnew %<CR>", { desc = "Open Current Tab in new one", silent = true }) --open current tab in new tab

-- personal
vim.keymap.set("n", "<C-q>", "<cmd>qa<cr>", { desc = "Quit All" })
vim.keymap.set("i", "jj", "<Esc><Esc>", { desc = "Normal Mode" })
vim.keymap.set("n", "0", "^", { desc = "Line start" })
vim.keymap.set("n", "Y", "y$", { desc = "Copy line end" })
vim.keymap.set("n", "<C-w>", ":bdelete<CR>", { desc = "Delete Buffer", silent = true })
vim.keymap.set("n", "tt", ":t.<CR>", { desc = "duplicate lines" })
vim.keymap.set("n", "<Leader>x", "<cmd>!chmod +x %<CR>", { desc = "File executable", silent = true })

-- maven
vim.keymap.set("n", "<Leader>m", ":Maven<CR>", { desc = " Maven" })

-- buscar en el visual
vim.keymap.set("x", "/", "<Esc>/\\%V")

-- Automaticamente agregar semicolon or comma al final de la linea en insert y en normal
vim.keymap.set("i", ";;", "<ESC>A;")
vim.keymap.set("i", ",,", "<ESC>A,")
vim.keymap.set("n", ";;", "A;<ESC>")
vim.keymap.set("n", ",,", "A,<ESC>")

-- Move lines of text up and down
-- Normal Mode
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { silent = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { silent = true })
-- Insert Mode
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { silent = true })
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { silent = true })
-- Visual Mode
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true })

-- lsp
-- Toggle LSP diagnostics visibility
local isLspDiagnosticsVisible = true
vim.keymap.set("n", "<leader>cx", function()
  isLspDiagnosticsVisible = not isLspDiagnosticsVisible
  vim.diagnostic.config({
    virtual_text = isLspDiagnosticsVisible,
    underline = isLspDiagnosticsVisible,
  })
end, { desc = "Toggle LSP diagnostics" })
