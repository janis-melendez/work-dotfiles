-- Configure autocomplete
return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        -- Completion sources
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",

        -- Snippet engine and snippet completion source
        "hrsh7th/vim-vsnip",
        "hrsh7th/cmp-vsnip",
    },
    config = function()
        local cmp = require("cmp")

        cmp.setup({
            snippet = {
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body)
                end,
            },

            window = {
                -- completion = cmp.config.window.bordered(),
                -- documentation = cmp.config.window.bordered(),
            },

            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),

                -- Accept currently selected item.
                -- select = true confirms first item even if nothing is selected.
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
            }),

            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "vsnip" },
            }, {
                { name = "buffer" },
            }),
        })

        -- Use buffer completion for "/" and "?" searches.
        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })

        -- Use path and command completion for ":" commands.
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
            }),
            matching = {
                disallow_symbol_nonprefix_matching = false,
            },
        })
    end,
}
