-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local opts = { noremap = true, silent = true }
vim.keymap.set({ "n", "v" }, "d", '"_d', { noremap = true, desc = "Black Hole Delete" })
vim.keymap.set({ "n", "v" }, "x", '"_x', { noremap = true, desc = "Black Hole Delete one symbol" })
vim.keymap.set({ "n", "v" }, "m", "d", { noremap = true, desc = "Black hole cut" })
vim.keymap.set({ "n", "v" }, "mm", "dd", { noremap = true, desc = "Black hole cut" })
vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)

-- package-info
-- Show dependency versions
vim.keymap.set({ "n" }, "<LEADER>ns", require("package-info").show, { silent = true, noremap = true, desc = "Show" })

-- Hide dependency versions
vim.keymap.set({ "n" }, "<LEADER>nc", require("package-info").hide, { silent = true, noremap = true, desc = "Hide" })

-- Toggle dependency versions
vim.keymap.set(
  { "n" },
  "<LEADER>nt",
  require("package-info").toggle,
  { silent = true, noremap = true, desc = "Toggle" }
)

-- Update dependency on the line
vim.keymap.set(
  { "n" },
  "<LEADER>nu",
  require("package-info").update,
  { silent = true, noremap = true, desc = "Update" }
)

-- Delete dependency on the line
vim.keymap.set(
  { "n" },
  "<LEADER>nd",
  require("package-info").delete,
  { silent = true, noremap = true, desc = "Delete" }
)

-- Install a new dependency
vim.keymap.set(
  { "n" },
  "<LEADER>ni",
  require("package-info").install,
  { silent = true, noremap = true, desc = "Install" }
)

-- Install a different dependency version
vim.keymap.set(
  { "n" },
  "<LEADER>np",
  require("package-info").change_version,
  { silent = true, noremap = true, desc = "Change version" }
)
-- vim.keymap.set({ "n", "v" }, "<Cmd>s", ":w", { noremap = true, desc = "save file" })
-- vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
-- vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "d", { desc = "Save file" })
vim.keymap.set({ "n" }, "<LEADER>os", "<cmd>ObsidianSearch<cr>", { desc = "Search" })
vim.keymap.set({ "n" }, "<LEADER>ob", "<cmd>ObsidianBacklinks<cr>", { desc = "Backlinks" })
vim.keymap.set({ "n" }, "<LEADER>ot", "<cmd>ObsidianTags<cr>", { desc = "Tags" })
vim.keymap.set({ "n" }, "<LEADER>oo", "<cmd>ObsidianOpen<cr>", { desc = "Open note" })
vim.keymap.set({ "n" }, "<LEADER>oq", "<cmd>ObsidianQuickSwitch<cr>", { desc = "Quick switch" })
vim.keymap.set({ "n" }, "<LEADER>od", "<cmd>ObsidianToday<cr>", { desc = "Daily Note" })
vim.keymap.set({ "n" }, "<LEADER>op", "<cmd>ObsidianPasteImg<cr>", { desc = "Paste image" })
