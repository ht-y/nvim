local dap = require("dap")
local dapui = require("dapui")

require("dapui").setup()
require("nvim-dap-virtual-text").setup({})

-- 自动开关 UI
dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"]      = function() dapui.close() end

-- codelldb adapter（需要你系统里有 codelldb，推荐用 Mason 安装）
-- :Mason -> 安装 codelldb
local mason_path = vim.fn.stdpath("data") .. "/mason"
local codelldb_path = mason_path .. "/packages/codelldb/extension/adapter/codelldb"

dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = codelldb_path,
    args = { "--port", "${port}" },
  },
}

dap.configurations.c = {
  {
    name = "Launch (codelldb)",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/build/ale_pampa", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
}
dap.configurations.cpp = dap.configurations.c

-- 常用按键（你也可以移到 keymaps.lua）
vim.keymap.set("n", "<F5>", dap.continue)
vim.keymap.set("n", "<F10>", dap.step_over)
vim.keymap.set("n", "<F11>", dap.step_into)
vim.keymap.set("n", "<F12>", dap.step_out)
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>du", dapui.toggle)
