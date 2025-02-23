vim.g.mapleader = " "

-- Quit
vim.keymap.set('n', "<C-q>", "<cmd>:q<CR>")

-- Copy all
vim.keymap.set('n', "<C-a>", "<cmd>%y+<CR>")

-- Save
vim.keymap.set('n', "<C-s>", "<cmd>:w<CR>")

-- Telescope
vim.keymap.set('n', "<S-t>", "<:Telescope find_files<CR>")

-- NeoTree
vim.keymap.set('n', "<leader>t", ":Neotree float reveal<CR>")
vim.keymap.set('n', '<leader>e', ':Neotree left reveal<CR>')

-- Terminal
vim.keymap.set('n', 't', "<cmd>:ToggleTerm direction=tab name=terminal<CR>")

