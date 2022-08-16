if exists("g:neovide")
  " Put anything you want to happen only in Neovide here
endif

" 刷新率
let g:neovide_refresh_rate=60

" 空闲刷新率
let g:neovide_refresh_rate_idle=1

" 背景透明度
" let g:neovide_transparency=0

" 背景颜色（目前仅限 macOS）
" g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
"let g:neovide_transparency=0.0
"let g:transparency = 0.8
"let g:neovide_background_color = '#0f1117'.printf('%x', float2nr(255 * g:transparency))

" 动模糊量
let g:neovide_floating_blur_amount_x = 2.0
let g:neovide_floating_blur_amount_y = 2.0

" 全屏
let g:neovide_fullscreen=v:true

" 粒子
" let g:neovide_cursor_vfx_mode = "pixiedust"



