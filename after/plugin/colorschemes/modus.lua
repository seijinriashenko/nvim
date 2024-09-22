---@diagnostic disable: inject-field
local status, modus_themes = pcall(require, "modus-themes")
if not status then
    return
end

-- Default options
modus_themes.setup({
    -- Theme comes in two styles `modus_operandi` and `modus_vivendi`
    -- `auto` will automatically set style based on background set with vim.o.background
    style = "auto",
    variant = "tritanopia", -- Theme comes in four variants `default`, `tinted`, `deuteranopia`, and `tritanopia`
    transparent = false, -- Transparent background (as supported by the terminal)
    dim_inactive = false, -- "non-current" windows are dimmed
    styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = false },
        functions = {},
        variables = {},
    },

    --- You can override specific color groups to use other groups or a hex color
    --- function will be called with a ColorScheme table
    ---@param colors ColorScheme
    on_colors = function(colors)
        colors.bg_main = "#000000"
        colors.comment = "#595959"
        colors.visual = "#dfa0f0"
        colors.red = "#ff5f59"
        colors.green = "#44df44"
        colors.yellow = "#dfcf43"
        colors.blue = "#82b0ec"
        colors.magenta = "#f78fe7"
        colors.cyan = "#9ac8e0"

        -- colors.rust =
        -- colors.gold =
        -- colors.pink =
        -- colors.maroon =
    end,

    --- You can override specific highlights to use other groups or a hex color
    --- function will be called with a Highlights and ColorScheme table
    ---@param highlights Highlights
    ---@param colors ColorScheme
    on_highlights = function(highlights, colors)
        highlights.LineNr = { fg = "#ffffff", bg = "#000000" }
        highlights.LineNrAbove = { fg = "#6e6e6e", bg = "#000000" }
        highlights.LineNrBelow = { fg = "#6e6e6e", bg = "#000000" }
    end,
})

vim.cmd.colorscheme("modus") -- modus_operandi, modus_vivendi
