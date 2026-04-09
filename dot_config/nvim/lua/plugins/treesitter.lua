return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').install { 'astro', 'css', 'glsl', 'go', 'html', 'javascript', 'json', 'jsx', 'lua', 'markdown', 'odin', 'tmux', 'tsx', 'typescript' }
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'astro', 'css', 'glsl', 'go', 'html', 'javascript', 'json', 'jsx', 'lua', 'markdown', 'odin', 'tmux', 'tsx', 'typescript' },
      callback = function()
        vim.treesitter.start()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
