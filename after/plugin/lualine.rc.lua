local status, lualine = pcall(require, "lualine")
if (not status) then return end

lualine.setup {
  options = {
    icons_enable = true,
    theme = "solarized_dark",
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      lualine_c = {
        {
          "filename",
          file_status = true, -- displays file status
          path = 0 -- 0 = just filename
        }
      },
      lualine_x = {
        {
          "diagnostics",
          soures = {
            "nvim_diagnostic"
          },
          symbols = {
            unix = '', -- e712
            dos = '',  -- e70f
            mac = '',  -- e711
            error = " ",
            warn = " ",
            info = " ",
            hint = " "
          },
          lualine_y = { "progress" },
          lualine_z = { "location" }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {
            {
              "filename",
              file_status = true,
              path = 1 -- 1 relative path
            }
          },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {}
        }
      }
    }
  }
}
