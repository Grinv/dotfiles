return {
  "nvim-lualine/lualine.nvim",
  opts = function()
    -- PERF: we don't need this lualine require madness 🤷
    local lualine_require = require("lualine_require")
    lualine_require.require = require

    local icons = require("lazyvim.config").icons

    vim.o.laststatus = vim.g.lualine_laststatus

    return {

      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          {
            "filename",
            file_status = true, -- displays file status (readonly status, modified status)
            path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
          },
        },
        lualine_x = { "filesize", "encoding", "filetype" },
        lualine_y = {},
        lualine_z = {
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },

            diagnostics_color = {
              -- Same values as the general color option can be used here.
              error = "DiagnosticError", -- Changes diagnostics' error color.
              warn = "DiagnosticWarn", -- Changes diagnostics' warn color.
              info = "DiagnosticInfo", -- Changes diagnostics' info color.
              hint = "DiagnosticHint", -- Changes diagnostics' hint color.
            },
          },
        },
      },
    }
  end,
}
