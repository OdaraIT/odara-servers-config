return {
  -- NOTE:   Módulo Explorer para navegação e visualização no Neovim.
  --   Fornece uma interface interativa para explorar dados e estruturas.
  --   Suporte a expansão de nós, atalhos e navegação intuitiva.
  --   Configurável para diferentes tipos de dados e visualizações.
  --   Documentação: https://github.com/folke/snacks.nvim/blob/main/docs/explorer.md

  enabled = vim.g.odara.plugins.snacks_nvim.picker or false,

  finder = 'explorer',
  format = 'file',
  show_empty = true,
  hidden = true,
  ignored = true,
  follow = true,
  sort = { fields = { 'sort' } },
  supports_live = true,
  tree = true,
  watch = true,
  diagnostics = true,
  diagnostics_open = false,
  git_status = true,
  git_status_open = false,
  git_untracked = true,
  follow_file = true,
  focus = 'list',
  auto_close = false,
  jump = { close = false },
  layout = { preset = 'sidebar', preview = false },
  formatters = {
    file = { filename_only = true },
    severity = { pos = 'right' },
  },
  matcher = { sort_empty = false, fuzzy = false },

  config = function(opts)
    return require('snacks.picker.source.explorer').setup(opts)
  end,

  win = {
    list = {
      keys = {
        ['<BS>'] = 'explorer_up',
        ['l'] = 'confirm',
        ['h'] = 'explorer_close', -- close directory
        ['a'] = 'explorer_add',
        ['d'] = 'explorer_del',
        ['r'] = 'explorer_rename',
        ['c'] = 'explorer_copy',
        ['m'] = 'explorer_move',
        ['o'] = 'explorer_open', -- open with system application
        ['P'] = 'toggle_preview',
        ['y'] = { 'explorer_yank', mode = { 'n', 'x' } },
        ['p'] = 'explorer_paste',
        ['u'] = 'explorer_update',
        ['<c-c>'] = 'tcd',
        ['<leader>/'] = 'picker_grep',
        ['<c-t>'] = 'terminal',
        ['.'] = 'explorer_focus',
        ['I'] = 'toggle_ignored',
        ['H'] = 'toggle_hidden',
        ['Z'] = 'explorer_close_all',
        [']g'] = 'explorer_git_next',
        ['[g'] = 'explorer_git_prev',
        [']d'] = 'explorer_diagnostic_next',
        ['[d'] = 'explorer_diagnostic_prev',
        [']w'] = 'explorer_warn_next',
        ['[w'] = 'explorer_warn_prev',
        [']e'] = 'explorer_error_next',
        ['[e'] = 'explorer_error_prev',
      },
    },
  },
}
