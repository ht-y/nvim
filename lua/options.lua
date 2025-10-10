-- 选项配置
vim.opt.clipboard = 'unnamedplus' 			-- 使用系统粘贴板
vim.opt.completeopt = { 'menu', 'menuone', 'noselect'}  
vim.opt.mouse = 'a'					-- 允许使用鼠标

-- Tab
vim.opt.tabstop = 4 -- Tab 显示的宽度为 4 个空格
vim.opt.softtabstop = 4 -- 插入模式下 Tab 会插入 4 个空格
vim.opt.shiftwidth = 4 -- 自动缩进 4 个空格
vim.opt.expandtab = true 

-- UI 
vim.opt.number  = true -- 显示行号
vim.opt.relativenumber = true -- 显示相对行号
vim.opt.cursorline = true -- 高亮当前行
vim.opt.splitbelow = true -- 设置垂直分割窗口的时候，新开窗口在下方
vim.opt.splitright = true -- 设置水平分割窗口的时候，新开窗口在右方
-- vim.opt.showmode = false

-- Searching
vim.opt.incsearch = true -- 开启增量搜索
vim.opt.hlsearch = true -- 高亮匹配项
vim.opt.ignorecase = true -- 忽略大小写
vim.opt.smartcase = true -- 有大写的时候敏感
