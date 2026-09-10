-- Color highlighter
return {
    'norcalli/nvim-colorizer.lua',
    lazy = false,
    config = function()
        local colorizer = require('colorizer')

        colorizer.setup(
            {
                "*",
            },
            {
                RGB = true,
                RRGGBB = true,
                RRGGBBAA = true,
                names = true,
                mode = "background",
            }
        )

        vim.api.nvim_create_autocmd("BufEnter", {
            group = vim.api.nvim_create_augroup(
                "ColorizerNoFiletype",
                { clear = true }
            ),
            callback = function(args)
                local buf = args.buf

                if
                    vim.bo[buf].filetype == ""
                    and vim.bo[buf].buftype == ""
                    and not colorizer.is_buffer_attached(buf)
                then
                        colorizer.attach_to_buffer(buf)
                end
            end,
        })
    end,
}
