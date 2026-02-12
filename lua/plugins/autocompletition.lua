return {
    {
        'saghen/blink.cmp',
        -- Use a release tag to download pre-built binaries
        version = 'v0.*',
        -- This build step is required to fetch the fuzzy matching library
        build = 'nix run .#build-plugin',

        dependencies = {
            'rafamadriz/friendly-snippets',
            {
                'L3MON4D3/LuaSnip',
                version = 'v2.*',
                build = (function()
                    if vim.fn.has('win32') == 1 or vim.fn.executable('make') == 0 then return end
                    return 'make install_jsregexp'
                end)(),
            },
        },

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = {
                preset = 'default',
                ['<Tab>'] = { 'snippet_forward', 'fallback' },
                ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
            },

            appearance = {
                nerd_font_variant = 'normal',
                -- Syntax fix: kind_icons must be inside appearance
                kind_icons = {
                    Text = '[T]',
                    Method = '[M]',
                    Function = '[F]',
                    Constructor = '[C]',
                    Field = '[f]',
                    Variable = '[V]',
                    Class = '[C]',
                    Interface = '[I]',
                    Module = '[Mod]',
                    Property = '[P]',
                    Unit = '[U]',
                    Value = '[V]',
                    Enum = '[E]',
                    Keyword = '[K]',
                    Snippet = '[S]',
                    Color = '[Col]',
                    File = '[Fil]',
                    Reference = '[R]',
                    Folder = '[Dir]',
                    EnumMember = '[EM]',
                    Constant = '[Con]',
                    Struct = '[St]',
                    Event = '[Ev]',
                    Operator = '[Op]',
                    TypeParameter = '[Tp]',
                },
            },

            snippets = { preset = 'luasnip' },

            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },

            signature = { enabled = true },
        },
    },

    {
        'folke/tokyonight.nvim',
        priority = 1000,
        config = function()
            require('tokyonight').setup({
                styles = {
                    comments = { italic = false },
                },
            })
            vim.cmd.colorscheme 'tokyonight-night'
        end,
    },
}
