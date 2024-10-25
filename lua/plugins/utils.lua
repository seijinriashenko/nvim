return {
    { "farmergreg/vim-lastplace" },
    {
        "folke/todo-comments.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local todo_comments = require("todo-comments")

            todo_comments.setup({
                signs = true,
                keywords = {
                    FIX = {
                        icon = " ",
                        color = "error",
                        alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
                        -- signs = false, -- configure signs for some keywords individually
                    },
                    TODO = { icon = " ", color = "info" },
                    HACK = { icon = " ", color = "warning" },
                    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
                    PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                    NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
                    TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
                },
                colors = {
                    error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
                    warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
                    info = { "DiagnosticInfo", "#2563EB" },
                    hint = { "DiagnosticHint", "#10B981" },
                    default = { "Identifier", "#7C3AED" },
                    test = { "Identifier", "#FF00FF" },
                },
                search = {
                    pattern = [[\b(KEYWORDS):]], -- ripgrep regex
                    -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon (beware! false positives)
                },
            })

            vim.keymap.set("n", "]t", function()
                todo_comments.jump_next()
            end, { desc = "Next [T]ODO comment " })

            vim.keymap.set("n", "[t", function()
                todo_comments.jump_prev()
            end, { desc = "Previous [T]ODO comment " })
        end,
    },
}
