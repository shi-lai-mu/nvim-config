local lang = {}
local conf = require("modules.lang.config")

lang["fatih/vim-go"] = {
	opt = true,
	ft = "go",
	run = ":GoInstallBinaries",
	config = conf.lang_go,
}
lang["rust-lang/rust.vim"] = { opt = true, ft = "rust" }
lang["simrat39/rust-tools.nvim"] = {
	opt = true,
	ft = "rust",
	config = conf.rust_tools,
	requires = { { "nvim-lua/plenary.nvim", opt = false } },
}
-- lang["kristijanhusak/orgmode.nvim"] = {
--     opt = true,
--     ft = "org",
--     config = conf.lang_org
-- }
lang["iamcco/markdown-preview.nvim"] = {
	opt = true,
	ft = "markdown",
	run = "cd app && yarn install",
}
lang["chrisbra/csv.vim"] = { opt = true, ft = "csv" }


-- Typescript
lang["leafgarland/typescript-vim"] = { opt = true, ft = "typescript" }
lang["peitalin/vim-jsx-typescript"] = { opt = true, fn = "typescriptreact" }

-- Javascript
lang["jelera/vim-javascript-syntax"] = { opt = true, fn = "javascript" }
lang["pangloss/vim-javascript"] = { opt = true, fn = "javascript" }
lang["isRuslan/vim-es6"] = { opt = true, fn = "javascript" }
lang["tpope/vim-surround"] = { opt = true, fn = "javascript" }
lang["tpope/vim-repeat"] = { opt = true, fn = "javascript" }
lang["tomtom/tcomment_vim"] = { opt = true, fn = "javascript" }
lang["mattn/emmet-vim"] = { opt = true, fn = "javascript" }

lang["elzr/vim-json"] = { opt = true, fn = "json" }
lang["mxw/vim-jsx"] = { opt = true, fn = "react" }
lang["ap/vim-css-color"] = { opt = true, fn = "css" }
lang["styled-components/vim-styled-components"] = { opt = true, fn = "css" }

-- 注释
lang["b3nj5m1n/kommentary"] = {
	opt = true,
}
-- 注释
lang["JoosepAlviste/nvim-ts-context-commentstring"] = {
	opt = true,
}


return lang
