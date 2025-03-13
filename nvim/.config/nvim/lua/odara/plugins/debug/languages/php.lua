local dap = require('dap')

dap.adapters.php = {
  type = 'executable',
  command = '/usr/bin/php8.2',
  --  command = 'node',
  args = {
    require('mason-registry').get_package('php-debug-adapter'):get_install_path() .. '/extension/out/phpDebug.js',
  },
}

dap.configurations.php = {
  {
    type = 'php',
    request = 'launch',
    name = 'Listen for Xdebug',
    port = 9082,
    stopOnEntry = true,
    --pathMappings = {
    -- ['/workspace/dev/eng/cli/maiz-leads'] = '${workspaceFolder}',
    --},
  },
}
