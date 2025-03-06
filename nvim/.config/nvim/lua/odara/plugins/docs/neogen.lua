return {
  -- NOTE:   Gera automaticamente comentários de documentação no Neovim.
  --   Suporte a múltiplas linguagens, incluindo Lua, Python, Go e mais.
  --   Integra-se com Treesitter para análise precisa do código.
  --   Configurável para diferentes estilos de documentação, como JSDoc e Doxygen.
  --   Repositório: https://github.com/danymat/neogen
  'danymat/neogen',

  enabled = vim.g.odara.plugins.neogen,

  config = function()
    require('neogen').setup({
      enabled = true,
      languages = {
        lua = {
          template = {
            annotation_convention = 'ldoc',
          },
        },
      },
    })
  end,
}
