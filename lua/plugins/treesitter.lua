return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  config = function()
    local filetypes = {
      "lua", "vim", "vimdoc", "query",
      "c", "cpp", "rust", "go",
      "html", "css",
      "javascript", "typescript", "tsx",
      "json",
      "python",
      "java", "kotlin",
      "bash", "dockerfile",
      "yaml", "toml",
      "markdown", "markdown_inline",
      "sql",
    }

    require("nvim-treesitter").install(filetypes)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = filetypes,
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}

