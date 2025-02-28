require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "css", "html", "php", "vimdoc","vim", "query", "markdown", "markdown_inline", "python" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
