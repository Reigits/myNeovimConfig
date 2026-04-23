-- In ftplugin files, we use 0 to represent the "current buffer"
local bufnr = 0

-- 1. Find the root directory
local root_dir = vim.fs.root(bufnr, { "src", ".git" }) or vim.fn.getcwd()
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = 'C:/Users/Rei/AppData/Local/nvim-data/jdtls_workspace/' .. project_name

local config = {
  name = 'jdtls',
  cmd = {
        "jdtls", '--data', workspace_dir
    },
  root_dir = root_dir,
  settings = {
    java = {
        project = { sourcePaths = {"src"}, outputPath = ".bin"},
        import = { gradle = {enabled = false}}
    }
    }
  }
require('jdtls').start_or_attach(config)

