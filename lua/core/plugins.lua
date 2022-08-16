local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
end

-- brew install tree-sitter

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use "wbthomason/packer.nvim"
  use {
    "svrana/neosolarized.nvim",
    requires = { "tjdevries/colorbuddy.nvim" }
  }
  -- use "hoob3rt/lualine.nvim" -- Statusline
  -- use "kyazdani42/nvim-web-devicons"
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use "kyazdani42/nvim-web-devicons" -- File icons
  use "L3MON4D3/LuaSnip" -- Snippet

  use "onsails/lspkind-nvim" -- vscode-link pictograms
  use "hrsh7th/cmp-buffer" -- nvim-cmp source for buffer words
  use "hrsh7th/cmp-nvim-lsp" -- nvim-cmp source for neovim's built-in LSP
  use "hrsh7th/nvim-cmp" -- Completion

  use "neovim/nvim-lspconfig" -- LSP

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate"
  }

  use "windwp/nvim-autopairs"
  use "windwp/nvim-ts-autotag"
end)
