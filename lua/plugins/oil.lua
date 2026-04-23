return {
  'stevearc/oil.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- Use devicons since you already have it
  config = function()
    -- This is the 'require' you're looking for!
    require("oil").setup({
      -- Your configuration goes here
      default_file_explorer = true,
      columns = {
        "icon",
      },
      view_options = {
        show_hidden = true,
      },
    })

    -- Optional: Set a keymap to open Oil (the '-' key is the classic choice)
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory in Oil" })
  end,
}
