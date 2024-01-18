return {
  {
    "rbong/vim-flog",
    lazy = true,
    cmd = { "Flog", "Flogsplit", "Floggit" },
    dependencies = {
      "tpope/vim-fugitive",
    },
    keys = {
      { "<leader>gfg", "<cmd>Flog<cr>", desc = "Flog Graph" },
      { "<leader>gfs", "<cmd>Flogsplit<cr>", desc = "Flog Graph Split" },
    },
  },
}
