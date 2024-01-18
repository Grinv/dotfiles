return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = false,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Second Brain",
      },
    },
    notes_subdir = "Notes",
    daily_notes = {
      folder = "Daily",
      template = "Daily.md",
    },
    templates = {
      subdir = "Templates",
    },
  },
}
