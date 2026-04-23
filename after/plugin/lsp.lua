vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }}}}})

vim.lsp.enable("clangd")
vim.lsp.enable("basedpyright")
vim.lsp.enable("lua_ls")
