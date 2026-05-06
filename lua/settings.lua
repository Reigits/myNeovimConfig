vim.opt.wrap = false
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.o.termguicolors = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showtabline = 2
vim.opt.fillchars = { eob = ' ' }
vim.opt.signcolumn = "yes"
vim.opt.splitright = true
vim.opt.autochdir = false

-- Force matching brackets to have a bright blue background and bold white text
vim.api.nvim_set_hl(0, "MatchParen", { bg = "#0055ff", fg = "#ffffff", bold = true })

-- Force "VS Code Style" colors for the Autocomplete Menu
-- Paste this at the bottom of your init.lua

-- Gray for "Text"
vim.api.nvim_set_hl(0, 'CmpItemKindText', { fg = '#9CDCFE' })

-- Pink/Purple for Functions & Methods
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { fg = '#C586C0' })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { fg = '#C586C0' })

-- Blue for Keywords & Properties
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { fg = '#569CD6' })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { fg = '#569CD6' })
vim.api.nvim_set_hl(0, 'CmpItemKindField', { fg = '#569CD6' }) -- Struct Fields!

-- Light Blue for Variables
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { fg = '#9CDCFE' })

-- Yellow for Classes & Structs
vim.api.nvim_set_hl(0, 'CmpItemKindClass', { fg = '#ECCD6F' })
vim.api.nvim_set_hl(0, 'CmpItemKindStruct', { fg = '#ECCD6F' }) -- Structs!

-- Green for Strings & Snippets
vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { fg = '#D4D4D4' }) -- Or '#4EC9B0' for green
