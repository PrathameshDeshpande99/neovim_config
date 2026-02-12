vim.opt.clipboard = "unnamedplus"

require("core.options")
require("core.keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        error("Error cloning lazy.nvim:\n" .. out)
    end
end
local rtp = vim.opt.rtp
rtp:prepend(lazypath)
-- and the code above just setups and calls the setup manager
-- this setup plugs in and calls all the setup we put in here
require("lazy").setup({
    require("plugins.neotree"),
    require("plugins.colortheme"),
    require("plugins.bufferline"),
    require("plugins.lualine"),
    require("plugins.treesitter"),
    require("plugins.telescope"),
    require("plugins.lsp"),
    require("plugins.autocompletition"),
    require("plugins.autoformating"),
    require("plugins.gitsigns"),
    require("plugins.alpha"),
    require("plugins.indent-blankline"),
    require("plugins.misc"),
})
