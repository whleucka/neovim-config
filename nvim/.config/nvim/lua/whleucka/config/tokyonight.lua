-- Returns either day or night theme, depending on the current time of day
local day_n_night = function()
    local hour = tonumber(os.date("%H"))
    local month = tonumber(os.date("%m"))
    local dst_on = (month >= 3 and month <= 11) and true or false
    local sun_up = dst_on and 6 or 8
    local sun_down = dst_on and 18 or 16
    if hour >= sun_up and hour <= sun_down then
        vim.cmd [[hi ColorColumn ctermbg=0 guibg=#dddddd]]
        return "day"
    end
    vim.cmd [[hi ColorColumn ctermbg=0 guibg=#2f384f]]
    return "night"
end

require("tokyonight").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = day_n_night(), -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
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
    sidebars = "normal", -- style for sidebars, see below
    floats = "normal", -- style for floating windows
  },
  sidebars = { "qf", "help", "terminal" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
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
