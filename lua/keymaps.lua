-- 快捷键设置
-- 一键编译到 quickfix
vim.api.nvim_create_user_command("Make", function()
  vim.cmd("cclose")
  vim.fn.setqflist({})
  vim.cmd("make!")
  vim.cmd("copen")
end, {})

-- 如果你用 telescope
vim.keymap.set("n", "<leader>ff", function()
  require("telescope.builtin").find_files()
end, { silent = true })
vim.keymap.set("n", "<leader>fg", function()
  require("telescope.builtin").live_grep()
end, { silent = true })
vim.keymap.set("n", "<leader>fb", function()
  require("telescope.builtin").buffers()
end, { silent = true })
