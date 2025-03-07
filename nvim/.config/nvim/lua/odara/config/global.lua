return {
  is_dev = true,
  is_servers = false,

  files = {
    hidden_files = false,
    git_no_ignore = false,
    git_no_ignore_parent = false,
    follow_symlinks = true,
    vimgrep_arguments = require('odara.config.defaults.vimgrep-arguments'),
    ignore_patterns = require('odara.config.defaults.ignore-patters-files'),
    tree_ignore_patterns = require('odara.config.defaults.ignore-patters-tree'),
  },

  skip_lsp = false,
  skip_none_ls = false,
  has_nerd_font = true,
  linters = {
    enable_phpstan = false,
    enable_phpcs = false,
    enable_phpmd = false,
  },
  fonts = {
    nerd_font_available = true,
    nerd_font = 'JetBrains Mono Nerd Font',
  },
  binaries = {
    python_path = os.getenv('ODARA_PYTHON_PATH') or '/home/linuxbrew/.linuxbrew/bin/python3',
  },
}
