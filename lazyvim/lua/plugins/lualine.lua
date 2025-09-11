return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    local theme = require("lualine.themes.catppuccin")
    local base_bg = theme.normal.c.bg
    -- theme.normal.c.bg = theme.normal.b.bg
    -- theme.inactive.b.bg = theme.normal.c.bg
    theme.inactive.b.bg = theme.normal.b.bg
    theme.inactive.b.fg = theme.inactive.c.fg
    theme.inactive.b.gui = nil

    opts.options = {
      theme = theme,
      section_separators = { left = "", right = "" },
      component_separators = { right = "", left = "" },
    }
    opts.sections = {
      lualine_a = { {
        "mode",
        fmt = function(txt) return txt:sub(1, 1) end,
        separator = { right = "", left = "" },
      } },
      lualine_b = {
        {
          "buffers",
          icons_enabled = false,
          use_mode_colors = true,
          symbols = { modified = "", alternate_file = "", directory = "" },
          separator = { right = "", left = "" },
        }
      },
      lualine_c = {},
      lualine_x = {
        -- stylua: ignore
        {
          function() return "  " .. require("dap").status() end,
          cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
        },
      },
      lualine_y = {
        {
          "filename",
          file_status = false,
          path = 1,
          shorting_target = 40,
          symbols = { modified = "", alternate_file = "", directory = "" },
          color = { bg = theme.normal.c.bg, fg = theme.inactive.c.fg },
        },
        {
          "progress",
          padding = { left = 0, right = 1 },
          color = { bg = theme.normal.c.bg, fg = theme.normal.b.fg },
        },
        {
          "location",
          padding = { left = 1, right = 1 },
          color = { bg = theme.inactive.b.bg, fg = theme.normal.b.fg },
          separator = { left = "", right = "" },
        },
      },
      lualine_z = {
        {
          function()
            return os.date("%R")
          end,
          separator = { left = "", right = "" },
        }
      },
    }
    opts.incative_sections = {}
  end
}
