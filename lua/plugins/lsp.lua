return {
  { "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      -- Standard Mason setup (No capabilities injection needed anymore)
      require("mason-lspconfig").setup({
          ensure_installed = { "clangd", "lua_ls", "basedpyright" },
          handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({})
          end,

    -- 2. The Clangd "Silver Bullet"
          ["clangd"] = function()
              require("lspconfig").clangd.setup({
                  cmd = {
                        "clangd",
                          "--background-index",
                          "--clang-tidy",
                          "--header-insertion=iwyu",
                          -- Pointing clangd directly to your new GCC engine
                          "--query-driver=C:/msys64/ucrt64/bin/*",
                  }
              })
          end,
        }
      })
    end,
  }
}
