-- Set the editor colorscheme
return {
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        name = 'gruvbox-material',

        -- Uncomment lines below to set colorscheme
        priority = 1000,
        config = function()
            ---@enum "hard" | "medium" | "soft"
            ---@default "medium"
            vim.g.gruvbox_material_background = "hard"

            ---@enum "material" | "mix" | "original"
            ---@default "material"
            vim.g.gruvbox_material_foreground = "material"

            vim.g.gruvbox_material_enable_italic = true

            vim.cmd.colorscheme('gruvbox-material')

            -- Make strings italic like classic gruvbox
            local function italicize(group)
                local ok, hl = pcall(vim.api.nvim_get_hl, 0, {
                    name = group,
                    link = false,
                })

                if ok then
                    hl.italic = true
                    vim.api.nvim_set_hl(0, group, hl)
                end
            end

            italicize("String")
            italicize("Character")
            italicize("@string")
            italicize("@string.documentation")
            italicize("@string.regexp")
            italicize("@string.special")
        end,
    }
}
