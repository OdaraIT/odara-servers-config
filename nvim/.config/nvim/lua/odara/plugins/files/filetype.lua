return {
  -- NOTE:   Plugin leve e rápido para detecção de tipos de arquivo no Neovim.
  --   Substitui o sistema nativo, tornando a inicialização mais veloz.
  --   Suporte a configuração personalizada de associações de tipos de arquivo.
  --   Compatível com padrões globais e detecção baseada no conteúdo do arquivo.
  --   Repositório: https://github.com/nathom/filetype.nvim
  'nathom/filetype.nvim',

  enabled = vim.g.odara.plugins.filetype_nvim or false,

  config = function()
    vim.g.did_load_filetypes = 0
    vim.g.do_filetype_lua = 1
  end,
}
