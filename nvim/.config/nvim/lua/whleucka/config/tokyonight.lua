-- Returns either day or night theme, depending on the current time of day
local day_n_night = function()
    local now = os.time()
    -- t for isdst
    local t = os.date("*t", now)
    -- current 24 hr
    local hour = tonumber(os.date("%H"))
    -- todo: make this dynamic?
    local sun_up = t.isdst and 6 or 8
    local sun_down = t.isdst and 20 or 16
    if hour >= sun_up and hour <= sun_down then
        -- day is a bit bright, so I will default on moon or storm
        -- return "day"
        return "storm"
    end
    return "night"
end

local day_or_night = day_n_night()
local background_style = day_or_night == "day" and "normal" or "dark"

require("tokyonight").setup({
    -- your configuration comes here
    -- or leave it empty to use the default settings
    style = day_or_night, -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
    light_style = "day", -- The theme is used when the background is set to light
    transparent = false, -- Enable this to disable setting the background color
    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
    styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = background_style, -- style for sidebars, see below
        floats = background_style, -- style for floating windows
    },
    sidebars = { "qf", "help", "terminal", "packer" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
    day_brightness = 0.4, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
    hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
    dim_inactive = false, -- dims inactive windows
    lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

    --- You can override specific color groups to use other groups or a hex color
    --- function will be called with a ColorScheme table
    ---@param colors ColorScheme
    on_colors = function(colors) end,

    --- You can override specific highlights to use other groups or a hex color
    --- function will be called with a Highlights and ColorScheme table
    ---@param highlights Highlights
    ---@param colors ColorScheme
    on_highlights = function(highlights, colors) end,
})
