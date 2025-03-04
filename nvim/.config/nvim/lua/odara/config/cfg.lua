local project_root = vim.fn.getcwd()
local config_file = project_root .. '/.nvim.lua'
local local_config = {}

if vim.fn.filereadable(config_file) == 1 then
  local_config = loadfile(config_file)()

  if not type(local_config) == 'table' then
    local_config = {}
  end
end

local config = {
  global = require('odara.config.global'),
  plugins = require('odara.config.plugins'),
}

local odara_type = os.getenv('ODARA_TYPE') or 'dev'
local servers_config = {}

if odara_type == 'servers' then
  config.global.is_dev = true
  config.global.is_servers = true

  servers_config = require('odara.config.servers')
else
  config.global.is_dev = true
  config.global.is_servers = false
end

config = vim.tbl_deep_extend('force', config, servers_config, local_config)

print(config.global.files.hidden_files)

vim.g.odara = config
