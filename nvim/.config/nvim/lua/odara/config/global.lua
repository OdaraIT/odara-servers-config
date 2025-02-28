return {
  is_dev = true,
  is_servers = false,
  files = {
    hidden_files = false,
    git_ignored_files = false,
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--hidden',
      '--smart-case',
      -- '--ignore-file',
      -- '.gitignore',
      -- '--exclude',
      -- 'node_modules',
      -- '--exclude',
      -- 'build',
      -- '--exclude',
      -- '.env',
      -- '--exclude',
      -- '*.log',
      -- '--exclude',
      -- 'vendor',
      -- '--exclude',
      -- '*.phar',
      -- '--exclude',
      -- '*.bak',
    },
    file_ignore_patterns = {
      'node_modules', -- Ignora node_modules
      'build', -- Ignora build
      '.git', -- Ignora diretórios .git
      '*.log', -- Ignora arquivos de log
      '.env', -- Ignora arquivos .env
      'vendor', -- Ignora diretório vendor (Composer)
      '*.phar', -- Ignora arquivos PHAR (PHP Archive)
      '*.bak', -- Ignora arquivos de backup
    },
  },
  skip_lsp = false,
  skip_none_ls = false,
  has_nerd_font = true,
  linters = {
    enable_phpstan = true,
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
