local status, masonlsp = pcall(require, "mason-lspconfig")
if not status then return end

-- 1. Configuration de Mason-LSPConfig
masonlsp.setup({
    -- On automatise l'installation des serveurs que tu appelles plus bas
    ensure_installed = {
        "lua_ls",
        "pyright",
        "intelephense",
        "cssls",
        "html",
        "emmet_language_server",
        "ts_ls", -- Remplace tsserver
    },
    automatic_installation = true,
})

-- 2. Capabilities pour nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- 3. Configuration de Lspsaga (Version moderne)
require('lspsaga').setup({
    ui = {
        code_action_icon = "💡",
    },
    symbol_in_winbar = {
        enable = true,
        separator = '  ',
    },
})

-- 4. Keymaps (Nettoyés)
local opts = { noremap = true, silent = true }
local key = vim.keymap.set

key("n", "gd", "<Cmd>Lspsaga goto_definition<CR>", opts)
key("n", "gf", "<Cmd>Lspsaga lsp_finder<CR>", opts) -- Renommé en lsp_finder dans les versions récentes
key("n", "K", "<Cmd>Lspsaga hover_doc<cr>", opts)
key({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
key("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
key('i', '<C-k>', vim.lsp.buf.signature_help, opts)
key('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
key('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
key('n', 'gl', '<Cmd>Lspsaga show_line_diagnostics<CR>', opts)
key('n', 'go', '<Cmd>Lspsaga outline<CR>', opts)

-- 5. Configuration des serveurs via lspconfig
-- local lspconfig = require("lspconfig")

-- Liste des serveurs simples (sans config spécifique)
local servers = { "pyright", "intelephense", "cssls", "html", "emmet_language_server", "ts_ls" }

for _, lsp in ipairs(servers) do
    vim.lsp.config(lsp, {
        capabilities = capabilities
    })
    -- lspconfig[lsp].setup {
    --     capabilities = capabilities,
    -- }
end

-- Configuration spécifique pour Lua
vim.lsp.config('lua_ls', {
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
        },
    },
})

vim.lsp.enable('lua_ls')
