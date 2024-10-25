return {
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPre", "BufNewFile" },
        main = "ibl",
        opts = {
            indent = {
                char = "┃",
                tab_char = "┃",
            },
            scope = { show_start = false, show_end = false },
            exclude = {
                filetypes = {
                    "help",
                    "alpha",
                    "dashboard",
                    "neo-tree",
                    "Trouble",
                    "trouble",
                    "lazy",
                    "mason",
                    "notify",
                    "toggleterm",
                    "lazyterm",
                },
            },
        },
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local lualine = require("lualine")
            local lazy_status = require("lazy.status")

            lualine.setup({
                options = {
                    icons_enabled = true,
                    theme = "gruvbox",
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    globalstatus = false,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                    },
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", "diff", "diagnostics" },
                    lualine_c = { "filename" },
                    lualine_x = {
                        { -- check if there're any plugin updates
                            lazy_status.updates,
                            cond = lazy_status.has_updates,
                            color = { fg = "#f9d8b6" },
                        },
                        { "encoding" },
                        { "fileformat" },
                        { "filetype" },
                    },
                    lualine_y = { "progress" },
                    lualine_z = { "location" },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { "filename" },
                    lualine_x = { "location" },
                    lualine_y = {},
                    lualine_z = {},
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {},
            })
        end,
    },
    {
        "ray-x/lsp_signature.nvim",
        opts = {
            hint_prefix = "",
            bind = true,
            max_height = 12, -- max height of signature floating_window
            max_width = 80, -- max_width of signature floating_window, line will be wrapped if exceed max_width
            wrap = true, -- allow doc/signature text wrap inside floating_window, useful if your lsp return doc/sig is too long
            floating_window = false, -- show hint in a floating window, set to false for virtual text only mode
            floating_window_above_cur_line = false,
        },
        config = function(_, opts)
            require("lsp_signature").setup(opts)
        end,
    },
    { "stevearc/dressing.nvim", event = "VeryLazy" },
    { "j-hui/fidget.nvim", opts = {} },
}
