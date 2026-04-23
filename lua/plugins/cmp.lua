return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
    },
    -- THE UPGRADE: Using opts as a function instead of config
    opts = function()
        local cmp = require("cmp")

        local kind_icons = {
            Text = "󰉿", Method = "󰆧", Function = "󰊕", Constructor = "",
            Field = "󰜢", Variable = "󰀫", Class = "󰠱", Interface = "",
            Module = "", Property = "󰜢", Unit = "󰑭", Value = "󰎠",
            Enum = "", Keyword = "󰌋", Snippet = "", Color = "󰏘",
            File = "󰈙", Reference = "󰈇", Folder = "󰉋", EnumMember = "",
            Constant = "󰏿", Struct = "󰙅", Event = "", Operator = "󰆕",
            TypeParameter = "󰊄",
        }

        -- Notice we don't call cmp.setup() anymore. 
        -- We just return the table directly to Lazy!
        return {

            enabled = function()
                local context = require('cmp.config.context')
                return not context.in_treesitter_capture("string") and not context.in_treesitter_capture("String") and not context.in_treesitter_capture("comment") and not context.in_treesitter_capture("Comment")
            end,

            snippet = {
                expand = function(args)
                    vim.snippet.expand(args.body)
                end,
            },

            window = {
                completion = {
                    border = "rounded",
                    winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None",
                    scrollbar = false,
                },
                documentation = cmp.config.disable, 
            },

            formatting = {
                fields = { "kind", "abbr", "menu" },
                format = function(entry, vim_item)
                    vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
                    vim_item.menu = ({
                        nvim_lsp = "[LSP]",
                        buffer = "[Buffer]",
                        path = "[Path]",
                    })[entry.source.name]
                    return vim_item
                end,
            },

            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
                ["<Tab>"] = cmp.mapping.select_next_item(),
                ["<S-Tab>"] = cmp.mapping.select_prev_item(),
            }),

            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "buffer"},
                { name = "path" },
            }),

            experimental = {
                ghost_text = true,
            },
        }
    end,
}
