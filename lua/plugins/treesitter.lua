return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "cmake" },
    highlight = { enable = true },
    indent = { enable = true },
  },
}
