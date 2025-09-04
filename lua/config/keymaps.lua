-- Keymaps configuration
local keymap = vim.keymap.set

-- jk to escape in insert mode
keymap("i", "jk", "<ESC>", { desc = "Exit insert mode" })

-- Move selected lines in visual mode
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Leader keymaps
keymap("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
keymap("n", "<leader>q", "<cmd>q<CR>", { desc = "Close buffer" })

-- Buffer navigation
keymap("n", "L", "<cmd>bnext<CR>", { desc = "Next buffer" })
keymap("n", "H", "<cmd>bprevious<CR>", { desc = "Previous buffer" })

-- Window/Buffer management with <leader>b prefix
-- Navigate between windows
keymap("n", "<leader>bh", "<C-w>h", { desc = "Focus window left" })
keymap("n", "<leader>bj", "<C-w>j", { desc = "Focus window down" })
keymap("n", "<leader>bk", "<C-w>k", { desc = "Focus window up" })
keymap("n", "<leader>bl", "<C-w>l", { desc = "Focus window right" })

-- Move windows
keymap("n", "<leader>bH", "<C-w>H", { desc = "Move window left" })
keymap("n", "<leader>bJ", "<C-w>J", { desc = "Move window down" })
keymap("n", "<leader>bK", "<C-w>K", { desc = "Move window up" })
keymap("n", "<leader>bL", "<C-w>L", { desc = "Move window right" })

-- Resize windows
keymap("n", "<leader>b<", "<C-w>5<", { desc = "Resize window left" })
keymap("n", "<leader>b>", "<C-w>5>", { desc = "Resize window right" })
keymap("n", "<leader>b,", "<C-w>5-", { desc = "Resize window up" })
keymap("n", "<leader>b.", "<C-w>5+", { desc = "Resize window down" })
