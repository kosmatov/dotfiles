return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.tabline = {
      lualine_a = { { "mode", fmt = function(txt) return txt:sub(1, 1) end, } },
      lualine_c = {
        {
          "buffers",
          use_mode_colors = true,
          symbols = { modified = "", alternate_file = "", directory = "" },
        }
      },
      lualine_x = {
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        { "filename", file_status = false, path = 1, shorting_target = 40, symbols = { modified = "  ", readonly = "  ", unnamed = "" } },
        -- stylua: ignore
        {
          function() return "  " .. require("dap").status() end,
          cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
        },
        -- stylua: ignore
        {
          require("lazy.status").updates,
          cond = require("lazy.status").has_updates,
        },
        {
          "diff",
          source = function()
            local gitsigns = vim.b.gitsigns_status_dict
            if gitsigns then
              return {
                added = gitsigns.added,
                modified = gitsigns.changed,
                removed = gitsigns.removed,
              }
            end
          end,
        },
      },
      lualine_y = {
        { "progress", separator = " ",                  padding = { left = 1, right = 0 } },
        { "location", padding = { left = 0, right = 1 } },
      },
      lualine_z = {
        function()
          return os.date("%R")
        end,
      },
    }
    opts.sections = {}
    opts.incative_sections = {}
  end
}
