local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    display = {},
  },
  ensure_installed = {
    "tsx",
    "lua",
    "vim",
    "json",
    "css",
    "scss",
    "javascript",
    "vue",
    "html",
  },
  autotag = {
    enable = true
  }
}
