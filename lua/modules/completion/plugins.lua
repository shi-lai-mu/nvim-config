local completion = {}
local conf = require("modules.completion.config")

completion["neovim/nvim-lspconfig"] = {
	opt = true,
	event = "BufReadPre",
	config = conf.nvim_lsp,
}
completion["creativenull/efmls-configs-nvim"] = {
	opt = false,
	requires = "neovim/nvim-lspconfig",
}
completion["williamboman/nvim-lsp-installer"] = {
	opt = false,
}
completion["kevinhwang91/nvim-bqf"] = {
	opt = true,
	ft = "qf",
	config = conf.bqf,
}
completion["tami5/lspsaga.nvim"] = {
	opt = true,
	after = "nvim-lspconfig",
}
completion["stevearc/aerial.nvim"] = {
	opt = true,
	after = "nvim-lspconfig",
	config = conf.aerial,
}
completion["kosayoda/nvim-lightbulb"] = {
	opt = true,
	after = "nvim-lspconfig",
	config = conf.lightbulb,
}
completion["ray-x/lsp_signature.nvim"] = { opt = true, after = "nvim-lspconfig" }
completion["hrsh7th/nvim-cmp"] = {
	config = conf.cmp,
	event = "InsertEnter",
	requires = {
		{ "lukas-reineke/cmp-under-comparator" },
		{ "saadparwaiz1/cmp_luasnip", after = "LuaSnip" },
		{ "hrsh7th/cmp-nvim-lsp", after = "cmp_luasnip" }, --neovim 内置 LSP 客户端的 nvim-cmp 源
		{ "hrsh7th/cmp-nvim-lua", after = "cmp-nvim-lsp" }, --nvim-cmp source for neovim Lua API.
		{ "andersevenrud/cmp-tmux", after = "cmp-nvim-lua" },
		{ "hrsh7th/cmp-path", after = "cmp-tmux" },
		{ "f3fora/cmp-spell", after = "cmp-path" },--nvim-cmp 的拼写源基于 vim 的拼写建议
		{ "hrsh7th/cmp-buffer", after = "cmp-spell" }, --从buffer中智能提示
		{ "kdheepak/cmp-latex-symbols", after = "cmp-buffer" },
		-- {
		-- 	"tzachar/cmp-tabnine",
		-- 	run = "./install.sh",
		-- 	after = "cmp-latex-symbols",
		-- 	config = conf.tabnine,
		-- },
	},
}
completion["L3MON4D3/LuaSnip"] = {
	after = "nvim-cmp",
	config = conf.luasnip,
	requires = "rafamadriz/friendly-snippets", --代码段合集
}
completion["windwp/nvim-autopairs"] = {
	after = "nvim-cmp",
	config = conf.autopairs,
}
completion["github/copilot.vim"] = { opt = true, cmd = "Copilot" }

return completion
