require'nvim-treesitter.configs'.setup {
  --- A list of parser names, or "all"
  ensure_installed = {"c", "lua", "rust", "ruby", "vim", "java", "php", "javascript", "sql", "python", "css", "html", "dart", "perl", "tsx", "bash", "typescript", "phpdoc" },

  --- Install parsers synchronously (only applie to ensure installed)
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
  autotag = {
    enable = true
  }
}
