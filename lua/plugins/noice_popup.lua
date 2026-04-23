return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    views = {
        mini = {
            position = {
                row = 1,
                col = "100%",
            },
        },
    }
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
  }
}
