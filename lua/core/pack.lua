local global = require('core.global')

local fn, uv, api = vim.fn, vim.loop, vim.api
-- local status, packer = pcall(require, 'packer')
local packer = nil

local data_dir = global.data_dir
local vim_path = global.vim_path
local packer_compiled = data_dir .. "lua/_compiled.lua"
local modules_dir = vim_path .. "/lua/modules"

local Packer = {}


-- ensure packer installed
function Packer:init_ensure_plugins()
  local packer_dir = data_dir .. 'pack/packer/opt/packer.nvim'
  local state = uv.fs_stat(packer_dir)
  if not state then
    print("Packer is not installed")
    local cmd = "!git clone git@github.com:wbthomason/packer.nvim.git " .. packer_dir
    
    api.nvim_command(cmd)
    uv.fs_mkdir(data_dir .. 'lua', 511, function()
      assert("make compile path dir failed")
    end)
    self:load_packer()
    packer.install()
  end
end

-- load packer
function Packer:load_packer()
  if not packer then
    api.nvim_command("packadd packer.nvim")
    packer = require("packer")
  end

  local clone_timeout = 6000
  local default_url_format = "git@github.com:%s"

  if is_mac then
    packer.init({
      compile_path = packer_compiled,
      git = { clone_timeout = clone_timeout, default_url_format = default_url_format },
      disable_commands = true,
      max_jobs = 20,
      display = {
        open_fn = function()
          return require("packer.util").float({ border = "none" })
        end
      },
    })
  else
    -- or windows?
  end

  packer.reset()
  local use = packer.use
  self:load_plugins()
  use({ "wbthomason/packer.nvim", opt = true })
	for _, repo in ipairs(self.repos) do
		use(repo)
	end
end

--load all plugins
function Packer:load_plugins()
  self.repos = {}

  local get_plugins_list = function()
    local list = {}
    local tmp = vim.split(fn.globpath(modules_dir, "*/plugins.lua"), "\n")

    for _, f in ipairs(tmp) do
      list[#list + 1] = f:sub(#modules_dir - 6, - 1)
    end
    return list
  end

  local plugins_file = get_plugins_list()
  for _, m in ipairs(plugins_file) do
    local repos = require(m:sub(0, #m - 4))
    for repo, conf in pairs(repos) do
      self.repos[#self.repos + 1] = vim.tbl_extend("force", { repo }, conf)
    end
  end

end

local plugins = setmetatable({}, {
	__index = function(_, key)
		if not packer then
			Packer:load_packer()
		end
		return packer[key]
	end,
})

function plugins.ensure_plugins()
	Packer:init_ensure_plugins()
end

function plugins.load_compile()
	if vim.fn.filereadable(packer_compiled) == 1 then
		require("_compiled")
	else
		assert("Missing packer compile file Run PackerCompile Or PackerInstall to fix")
	end
	vim.cmd([[command! PackerCompile lua require('core.pack').back_compile()]])
	vim.cmd([[command! PackerInstall lua require('core.pack').install()]])
	vim.cmd([[command! PackerUpdate lua require('core.pack').update()]])
	vim.cmd([[command! PackerSync lua require('core.pack').sync()]])
	vim.cmd([[command! PackerClean lua require('core.pack').clean()]])
	vim.cmd([[autocmd User PackerComplete lua require('core.pack').back_compile()]])
	vim.cmd([[command! PackerStatus lua require('core.pack').compile() require('packer').status()]])
end

return plugins

-- vim.cmd [[packadd packer.nvim]]

-- packer.startup(function(use)
-- end)
