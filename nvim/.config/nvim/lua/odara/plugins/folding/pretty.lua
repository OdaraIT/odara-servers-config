return {
  -- NOTE:  Plugin para aprimorar a exibição de folds no Neovim.
  --  Personaliza a aparência dos folds com indentação e ícones.
  --  Suporte a destaque de sintaxe dentro dos folds recolhidos.
  --  Compatível com o sistema de folds nativo e plugins como nvim-ufo.
  --  Repositório: https://github.com/anuvyklack/pretty-fold.nvim
  'anuvyklack/pretty-fold.nvim',

  enabled = vim.g.odara.plugins.pretty_fold_nvim or false,

  dependencies = {
    -- NOTE:  Plugin avançado de folding para Neovim.
    --  Suporte a LSP, Treesitter e indentação para um folding mais preciso.
    --  Permite abrir e fechar folds de forma eficiente com atalhos personalizados.
    --  Integração com Lualine e pré-visualização de código dobrado.
    --  Repositório: https://github.com/kevinhwang91/nvim-ufo
    {
      'kevinhwang91/nvim-ufo',
      enabled = vim.g.odara.plugins.nvim_ufo or false,
    },
  },

  config = function()
    require('pretty-fold').setup({
      sections = {
        left = {
          'content',
        },
        right = {
          ' ',
          'number_of_folded_lines',
          ': ',
          'percentage',
          ' ',
          function(config)
            return config.fill_char:rep(3)
          end,
        },
      },

      fill_char = '•',

      remove_fold_markers = true,

      -- Keep the indentation of the content of the fold string.
      keep_indentation = true,

      -- Possible values:
      -- "delete" : Delete all comment signs from the fold string.
      -- "spaces" : Replace all comment signs with equal number of spaces.
      -- false    : Do nothing with comment signs.
      process_comment_signs = 'spaces',

      -- Comment signs additional to the value of `&commentstring` option.
      comment_signs = {},

      -- List of patterns that will be removed from content foldtext section.
      stop_words = {
        '@brief%s*', -- (for C++) Remove '@brief' and all spaces after.
      },

      add_close_pattern = true, -- true, 'last_line' or false

      matchup_patterns = {
        { '{', '}' },
        { '%(', ')' }, -- % to escape lua pattern char
        { '%[', ']' }, -- % to escape lua pattern char
      },

      ft_ignore = { 'neorg' },
    })
  end,
}
