local colors = {
  blue        = '#86BBD8',
  cyan        = '#06969A',
  black       = '#1F2430',
  white       = '#c6c6c6',
  red         = '#DA627D',
  violet      = '#9A348E',
  grey        = '#424C64',
  yellow      = '#FCA17D',
  blue_       = '#86BBD8EE',
  cyan_       = '#06969AEE',
  black_      = '#1F2430EE',
  white_      = '#c6c6c6EE',
  red_        = '#DA627DEE',
  violet_     = '#9A348EEE',
  grey_       = '#424C64EE',
  yellow_     = '#FCA17DEE',
  transparent = '00000000',
}

local powerline_pastel_theme = {
  normal = {
    a = { fg = colors.white, bg = colors.violet },
    b = { fg = colors.white, bg = colors.red },
    c = { fg = colors.grey, bg = colors.transparent },
    x = { fg = colors.grey, bg = colors.yellow },
    y = { fg = colors.grey, bg = colors.blue },
    z = { fg = colors.white, bg = colors.cyan },
  },

  insert = {
    a = { fg = colors.white, bg = colors.violet },
    b = { fg = colors.white, bg = colors.red },
    c = { fg = colors.grey, bg = colors.transparent },
    x = { fg = colors.grey, bg = colors.yellow },
    y = { fg = colors.grey, bg = colors.blue },
    z = { fg = colors.white, bg = colors.cyan },
  },

  visual = {
    a = { fg = colors.white, bg = colors.violet },
    b = { fg = colors.white, bg = colors.red },
    c = { fg = colors.grey, bg = colors.transparent },
    x = { fg = colors.grey, bg = colors.yellow },
    y = { fg = colors.grey, bg = colors.blue },
    z = { fg = colors.white, bg = colors.cyan },
  },

  replace = {
    a = { fg = colors.white, bg = colors.violet },
    b = { fg = colors.white, bg = colors.red },
    c = { fg = colors.grey, bg = colors.transparent },
    x = { fg = colors.grey, bg = colors.yellow },
    y = { fg = colors.grey, bg = colors.blue },
    z = { fg = colors.white, bg = colors.cyan },
  },

  inactive = {
    a = { fg = colors.white, bg = colors.violet },
    b = { fg = colors.white, bg = colors.red },
    c = { fg = colors.grey, bg = colors.transparent },
    x = { fg = colors.grey, bg = colors.yellow },
    y = { fg = colors.grey, bg = colors.blue },
    z = { fg = colors.white, bg = colors.cyan },
  },

  command = {
    a = { fg = colors.white, bg = colors.violet },
    b = { fg = colors.white, bg = colors.red },
    c = { fg = colors.grey, bg = colors.transparent },
    x = { fg = colors.grey, bg = colors.yellow },
    y = { fg = colors.grey, bg = colors.blue },
    z = { fg = colors.white, bg = colors.cyan },
  },
}

return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("lualine").setup({
      options = {
        theme = powerline_pastel_theme,
        component_separators = '|',
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = {
          { 'mode', separator = { left = '', right = '' }, right_padding = 1 },
        },
        lualine_b = {
          { 'filename', file_status = true, newfile_status = true, path = 0, separator = { right = '' },
            right_padding = 1 },
        },
        lualine_c = {
          {},
        },
        lualine_x = {
          { 'branch', separator = { left = '' }, right_padding = 1 },
        },
        lualine_y = {
          { 'filetype', colored = false, separator = { left = '' } },
        },
        lualine_z = {
          { 'datetime', style = ("%H:%M"), separator = { right = '', left = '' }, left_padding = 1 },
        },
      },

      inactive_sections = {
        lualine_a = {
          { 'filename', separator = { left = '', right = '' }, right_padding = 1 },
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {
          { 'fileformat', separator = { right = '', left = '' }, left_padding = 1 },
        },
      },
      tabline = {},
      extensions = {},
    })
  end
}
