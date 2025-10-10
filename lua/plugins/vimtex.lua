return {
  'lervag/vimtex',
  lazy = false, -- lazy-loading will disable inverse search
  init = function()
            vim.g.tex_flavor = 'latex'
            -- 禁用内置的 tex 插件
            vim.g.vimtex_tex_flavor = 'latex'
  end,
  config = function()
    vim.api.nvim_create_autocmd({ 'FileType' }, {
      group = vim.api.nvim_create_augroup('lazyvim_vimtex_conceal', { clear = true }),
      pattern = { 'bib', 'tex' },
      callback = function()
        vim.wo.conceallevel = 0
        local opts = { buffer = true, silent = true }
        vim.keymap.set("n", "<leader>ll", "<plug>(vimtex-compile)", opts)
        vim.keymap.set("n", "<leader>lv", "<plug>(vimtex-view)", opts)
        vim.keymap.set("n", "<leader>lt", "<plug>(vimtex-toc-open)", opts)
        vim.keymap.set("n", "<leader>le", "<plug>(vimtex-errors)", opts)
        vim.keymap.set("n", "<leader>lc", "<plug>(vimtex-clean)", opts)
        vim.keymap.set("n", "<leader>lg", "<plug>(vimtex-status)", opts)
      end,
    })
                -- 编译配置
    vim.g.vimtex_compiler_progname = 'nvr'
    vim.g.vimtex_compiler_method = 'latexmk'
    vim.g.vimtex_compiler_latexmk = {
    build_dir = 'build',
    options = {
                    '-pdf',
                    '-interaction=nonstopmode',
                    '-synctex=1',
                    '-file-line-error',
                }
            }
    vim.g.vimtex_mappings_disable = { ['n'] = { 'K' } } -- disable `K` as it conflicts with LSP hover
    --    vim.g.vimtex_quickfix_method = vim.fn.executable 'pplatex' == 1 and 'pplatex' or 'latexlog'
    vim.g.vimtex_quickfix_mode = 0 -- 编译器报错自动弹出(设置0为不自动弹出)
    vim.g.vimtex_view_method = 'general' -- 设置.
    vim.g.vimtex_view_general_viewer = 'SumatraPDF.exe'
    vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
    -- vim.g.Tex_ViewRule_pdf = 'SumatraPDF -reuse-instance -inverse-search "nvim -c \\":RemoteOpen +%l %f\\""'
    -- vim.g.vimtex_compiler_latexmk = {
    --   aux_dir = './aux',
    --   out_dir = './out',
    -- }
    
  end,
}
