return {
  -- NOTE:  Adiciona guias visuais para indentação no Neovim.
  --  Suporte a Treesitter e detecção de escopo para indentação inteligente.
  --  Configuração flexível para exibir níveis de indentação e linhas virtuais.
  --  Compatível com modos escuros e integração com temas.
  --  Repositório: https://github.com/lukas-reineke/indent-blankline.nvim
  'lukas-reineke/indent-blankline.nvim',

  enabled = vim.g.odara.plugins.indent_blankline_nvim or false,

  event = { 'BufReadPre', 'BufNewFile' },

  indent = {
    char = '▏',
    smart_indent_cap = true,
  },

  scope = {
    enabled = true,
    show_start = true,
    show_end = false,
  },

  exclude = {
    filetypes = { 'help', 'dashboard', 'NvimTree' },
    buftypes = { 'terminal' },
  },
}
