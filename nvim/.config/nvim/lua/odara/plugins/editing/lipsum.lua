return {
  -- NOTE:   Gerador de texto Lorem Ipsum para Neovim.
  --   Insere parágrafos, frases ou palavras fictícias rapidamente.
  --   Suporte a comandos e atalhos para geração dinâmica de texto.
  --   Configurável para diferentes comprimentos e estilos de saída.
  --   Repositório: https://github.com/derektata/lorem.nvim
  'derektata/lorem.nvim',

  enabled = vim.g.odara.plugins.lorem or false,

  config = function()
    require('lorem').setup({
      sentenceLength = {
        words_per_sentence = 8,
        sentences_per_paragraph = 6,
      },
      comma_chance = 0.3, -- Chance de 30% de inserir uma vírgula
      max_commas_per_sentence = 2, -- Máximo de 2 vírgulas por sentença
    })
  end,
}
