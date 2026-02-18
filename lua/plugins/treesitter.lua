return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  config = function()
    local filetypes = {
      -- Core Neovim & Config
      'lua', 'luadoc', 'vim', 'vimdoc', 'query', 'toml', 'yaml', 'json',

      -- Web Development
      'html', 'css', 'javascript', 'typescript', 'tsx', 'jsdoc', 'javascriptreact',

      -- Programming Languages (CSE Essentials)
      'python', 'c', 'cpp', 'rust', 'go', 'java', 'kotlin',

      -- Shell & DevOps
      'bash', 'dockerfile', 'make', 'cmake',

      -- Data & Documentation
      'sql', 'markdown', 'markdown_inline', 'diff', 'regex', 'git_config', 'gitignore'
    }
    require('nvim-treesitter').install(filetypes)
    vim.api.nvim_create_autocmd('FileType', {
      pattern = filetypes,
      callback = function() vim.treesitter.start() end,
    })
  end,
}
