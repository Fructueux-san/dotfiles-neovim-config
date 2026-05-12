-- On vérifie toujours si cmp_nvim_lsp est là pour les complétions
local status_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp then return end

local capabilities = cmp_lsp.default_capabilities()

-- 1. Définition de la fonction on_attach (formatage automatique)
local on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
            buffer = bufnr,
            callback = function()
                -- Utilisation de la fonction de formatage moderne
                vim.lsp.buf.format({ bufnr = bufnr, async = false })
            end,
        })
    end
end

-- 2. Configuration et Activation des serveurs (Nouvelle API 0.12)

-- Liste des serveurs avec une config standard
local servers = { "ts_ls", "cssls", "intelephense", "pyright", "gopls", "clangd" }

for _, lsp in ipairs(servers) do
    -- On définit la configuration via la nouvelle API
    vim.lsp.config(lsp, {
        capabilities = capabilities,
        on_attach = on_attach,
    })
    
    -- On active explicitement le serveur
    vim.lsp.enable(lsp)
end

-- Note : Tu n'as plus besoin de require("lspconfig") au début 
-- car Neovim 0.12 utilise ces tables nativement.



-- local status, nvim_lsp = pcall(require, "lspconfig")
-- if not status then
--     return
-- end
--
-- local protocol = require("vim.lsp.protocol")
--
-- local on_attach = function(client, bufnr)
--     -- format on save
--     if client.server_capabilities.documentFormattingProvider then
--         vim.api.nvim_create_autocmd("BufWritePre", {
--             group = vim.api.nvim_create_augroup("Format", { clear = true }),
--             buffer = bufnr,
--             callback = function()
--                 vim.lsp.buf.formatting_seq_sync()
--             end,
--         })
--     end
-- end
--
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
--
-- -- TypeScript
-- nvim_lsp.ts_ls.setup({
--     -- on_attach = on_attach,
--     capabilities = capabilities,
-- })
--
-- -- CSS
-- nvim_lsp.cssls.setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
-- })
--
-- nvim_lsp.intelephense.setup({
--   on_attach =  on_attach,
--   capabilities = capabilities
-- })
--
-- nvim_lsp.pyright.setup({
--   on_attach = on_attach,
--   capabilities = capabilities
-- })
--
-- -- nvim_lsp.jedi_language_server.setup({
-- --   on_attach = on_attach,
-- --   capabilities = capabilities
-- -- })
--
-- nvim_lsp.clangd.setup({
--   -- on_attach = on_attach,
--   -- capabilities = capabilities
-- })
--
-- nvim_lsp.gopls.setup({
--   -- on_attach = on_attach,
--   capabilities=capabilities
-- })
-- -- Tailwind
-- -- nvim_lsp.tailwindcss.setup({
-- --     on_attach = on_attach,
-- --     capabilities = capabilities,
-- -- })
