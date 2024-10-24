return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            require("gruvbox").setup({
                terminal_colors = true, -- add neovim terminal colors
                undercurl = true,
                underline = true,
                bold = true,
                italic = {
                    strings = false,
                    emphasis = true,
                    comments = true,
                    operators = false,
                    folds = true,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true, -- invert background for search, diffs, statuslines and errors
                contrast = "", -- can be "hard", "soft" or empty string
                palette_overrides = {
                    light1 = "#f9d8b6",
                },
                overrides = {
                    LspReferenceText = { bg = "#3c3836", bold = false },
                    LspReferenceRead = { bg = "#3c3836", bold = false },
                    LspReferenceWrite = { bg = "#3c3836", bold = true },
                },
                dim_inactive = false,
                transparent_mode = false,
            })
            vim.cmd.colorscheme("gruvbox")
        end
    },
    -- {
    --     "arturgoms/moonbow.nvim",
    --     priority = 1000,
    --     config = function()
    --         require("moonbow").setup({
    --             undercurl = true,
    --             underline = true,
    --             bold = true,
    --             italic = false,
    --             strikethrough = true,
    --             invert_selection = false,
    --             invert_signs = false,
    --             invert_tabline = false,
    --             invert_intend_guides = false,
    --             inverse = true,
    --             contrast = "",
    --             palette_overrides = {
    --                 light1 = "#f9d8b6",
    --             },
    --             overrides = {
    --                 LspReferenceText = { bg = "#3c3836", bold = false },
    --                 LspReferenceRead = { bg = "#3c3836", bold = false },
    --                 LspReferenceWrite = { bg = "#3c3836", bold = true },
    --             },
    --             dim_inactive = false,
    --             transparent_mode = false,
    --         })
    --         vim.cmd.colorscheme("moonbow")
    --     end,
    -- },
}
