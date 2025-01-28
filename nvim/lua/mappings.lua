require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")


-- Hacer que Shift+Tab reduzca la indentación
map('i', '<S-Tab>', '<C-D>', { noremap = true })  -- En modo insert
map('v', '<S-Tab>', '<C-D>', { noremap = true })  -- En modo visual
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

for _, mode in ipairs { "i", "v", "n", "x" } do
  -- duplicate line
  keymap(mode, "<S-Down>", "<cmd>t.<cr>", opts)
  keymap(mode, "<S-Up>", "<cmd>t -1<cr>", opts)
  -- save file
  keymap(mode, "<C-s>", "<cmd>silent! w<cr>", opts)
end

-- duplicate line visual block
keymap("x", "<S-Down>", ":'<,'>t'><cr>", opts)

-- move text up and down (using Ctrl + Alt + Up/Down)
keymap("x", "<C-A-Down>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<C-A-Up>", ":move '<-2<CR>gv-gv", opts)
keymap("n", "<C-A-Down>", "<cmd>m+<cr>", opts)
keymap("i", "<C-A-Down>", "<cmd>m+<cr>", opts)
keymap("n", "<C-A-Up>", "<cmd>m-2<cr>", opts)
keymap("i", "<C-A-Up>", "<cmd>m-2<cr>", opts)

-- close windows
keymap("n", "q", "<cmd>q<cr>", opts)
