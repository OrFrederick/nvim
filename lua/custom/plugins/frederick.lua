-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- https://github.com/LazyVim/LazyVim/discussions/1943
-- https://www.lazyvim.org/extras/lang/typescript#nvim-lspconfig
---- Remove unused imports on save
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  group = vim.api.nvim_create_augroup('ts_remove_unused', { clear = true }),
  pattern = { '*.tsx,*.ts' },
  callback = function()
    vim.lsp.buf.code_action {
      apply = true,
      context = {
        only = { 'source.removeUnused.ts' },
        diagnostics = {},
      },
    }
  end,
})
return {}
