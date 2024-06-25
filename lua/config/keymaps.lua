-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local del = vim.keymap.del
local opts = { noremap = true, silent = true }
-- local Util = require("lazyvim.util")

-- Clean unused keymaps
local unused_keys = {
  "<leader>ft",
  "<leader>fT",
  "<leader>fn",
  "<leader>ww",
  "<leader>wd",
  "<leader>w-",
  "<leader>w|",
  "<C-/>",
  "<C-_>",
  "<C-s>",
  "<leader>qq",
  "<leader>wÞ",
  "<leader>l",
}
for _, key in pairs(unused_keys) do
  del("n", key)
end

-- Do things without affecting the registers
map("n", "x", '"_x')
map("n", "<Leader>p", '"0p')
map("n", "<Leader>P", '"0P')
map("v", "<Leader>p", '"0p')
map("n", "<Leader>d", '"_d')
map("n", "<Leader>D", '"_D')
map("v", "<Leader>d", '"_d')
map("v", "<Leader>D", '"_D')

-- Increment/decrement
map("n", "+", "<C-a>", opts)
map("n", "-", "<C-x>", opts)

-- Select all
map("n", "<C-a>", "gg<S-v>G", opts)

-- Disable continuations
map("n", "<Leader>o", "o<Esc>^Da", opts)
map("n", "<Leader>O", "O<Esc>^Da", opts)

-- Vertical movements
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "<C-d>", "<C-d>zz", opts)

-- Buffer / Windows
map("n", "<leader>w", "<cmd>write<cr>", { desc = "Save buffer" })
map("n", "<leader>cd", "<C-W>c", { desc = "Delete window", remap = true })

-- Search
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- Rename
map("n", "<leader>rn", ":IncRename ", opts)

-- LazyVim
map("n", "<leader>lv", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Lazygit
map("n", "<leader>lg", function()
  LazyVim.lazygit({ cwd = LazyVim.root.git() })
end, { desc = "Lazygit (Root Dir)" })
