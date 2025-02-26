return {
  -- NOTE:   Módulo Explorer para navegação e visualização no Neovim.
  --   Fornece uma interface interativa para explorar dados e estruturas.
  --   Suporte a expansão de nós, atalhos e navegação intuitiva.
  --   Configurável para diferentes tipos de dados e visualizações.
  --   Documentação: https://github.com/folke/snacks.nvim/blob/main/docs/explorer.md

  enabled = vim.g.odara.plugins.snacks_nvim.explorer or false,

  width = 60,

  show_hidden = true,

  config = function()
    -- Keymaps {{{

    local keymap = vim.keymap

    keymap.set('n', '<leader>ee', function()
      Snacks.explorer()
    end, { desc = 'Toggle File [E]xplor[e]r' })

    -- }}}
  end,
}
