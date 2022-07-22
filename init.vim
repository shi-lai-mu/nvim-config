" 配置文件导入 "{{{
" ---------------------------------------------------------------------
" 基础使用习惯配置
runtime ./vimrc.vim
" 插件管理
"./lua/plugins.lua
lua require('plugins')
" 按键映射
runtime ./maps.vim

source ~/.config/nvim/after/plugin/airline.rc.vim

" 引入主题
source ~/.config/nvim/colors/gruvbox_material.rc.vim

" 图标配置
source ~/.config/nvim/after/plugin/defx-icons.rc.vim
