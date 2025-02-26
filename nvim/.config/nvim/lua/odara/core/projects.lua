-- Projects Config Files {{{

local uv = vim.uv
local projects_dir = os.getenv('ODARA_NVIM_PROJECTS_DIR')

if not projects_dir then
  print('Erro: Variável de ambiente ODARA_NVIM_PROJECTS_DIR não está definida.')

  return
end

vim.g.project_name = nil

local function find_project_file(start_path)
  local function scan_dir(path)
    local handle = uv.fs_scandir(path)

    if not handle then
      return nil
    end

    while true do
      local name, file_type = uv.fs_scandir_next(handle)

      if not name then
        break
      end

      local full_path = path .. '/' .. name

      if file_type == 'file' then
        local project_name = name:match('%.nvim%.([a-z0-9-]+)%.lua$')

        if project_name then
          return project_name, full_path
        end
      elseif file_type == 'directory' then
        local project_name, found_path = scan_dir(full_path)

        if project_name then
          return project_name, found_path
        end
      end
    end

    return nil
  end

  return scan_dir(start_path)
end

local function relink_project(project_name, project_file)
  local link_path = projects_dir .. '/' .. project_name .. '.lua'

  local stat = uv.fs_lstat(link_path)

  if stat and stat.type == 'link' then
    uv.fs_unlink(link_path)
  end

  local success, err = uv.fs_symlink(project_file, link_path)

  if success then
    print('Link atualizado para o projeto: ' .. project_name)
  else
    print('Erro ao criar link simbólico: ' .. err)
  end
end

local project_name, project_file = find_project_file(vim.fn.getcwd())

vim.g.project_name = project_name

if vim.g.project_name then
  relink_project(vim.g.project_name, project_file)

  local success, err = pcall(require, 'odara.projects.' .. vim.g.project_name)

  if not success then
    print('Erro ao carregar o módulo: ' .. err)
  end
else
  print('Nenhum arquivo de projeto encontrado.')
end

-- }}}
