require("conform").setup({
  formatters_by_ft = {
    c = { "clang_format" },
    cpp = { "clang_format" },
  },
  format_on_save = {
    timeout_ms = 2000,
    lsp_fallback = true,
  },
})

-- 手动格式化快捷键（你也可以放到 keymaps.lua）
vim.keymap.set("n", "<leader>f", function()
  require("conform").format({ lsp_fallback = true })
end, { silent = true })
