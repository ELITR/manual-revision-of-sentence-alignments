" Run vim with left-file right-file
" then load this file:
"   :source manual-alignment.vimrc
" it will split the window, so load the other file there

set scrollopt=ver
set scrollbind

" setting visual cues in both windows
set cursorline
set wrap
set ff=unix
set nobomb
vsplit
2 wincmd w
next
set cursorline
set wrap
set ff=unix
set nobomb

" to add a third file
" run:   :call Third()
function Third()
  vsplit
  3 wincmd w
  next
  set wrap
  set ff=unix
  set nobomb
  " update synchronous moving and other commands
  map <Down> <Down><C-w><C-w><Down><C-w><C-w><Down><C-w><C-w>
  map <Up> <Up><C-w><C-w><Up><C-w><C-w><Up><C-w><C-w>
  map <C-Up> :1wincmd w<CR>gg:2wincmd w<CR>gg:3wincmd w<CR>gg
  map <C-Down> :1wincmd w<CR>G:2wincmd w<CR>G:3wincmd w<CR>G
endfunction

" to add a fourth file
" run:   :call Fourth()
function Fourth()
  vsplit
  4 wincmd w
  next
  set wrap
  set ff=unix
  set nobomb
  " update synchronous moving and other commands
  map <Down> <Down><C-w><C-w><Down><C-w><C-w><Down><C-w><C-w><Down><C-w><C-w>
  map <Up> <Up><C-w><C-w><Up><C-w><C-w><Up><C-w><C-w><Up><C-w><C-w>
  map <C-Up> :1wincmd w<CR>gg:2wincmd w<CR>gg:3wincmd w<CR>gg:4wincmd w<CR>gg
  map <C-Down> :1wincmd w<CR>G:2wincmd w<CR>G:3wincmd w<CR>G:4wincmd w<CR>G
endfunction


" easy jumps to windows:
map w1 :1 wincmd w<CR>
map w2 :2 wincmd w<CR>
map w3 :3 wincmd w<CR>
map w4 :4 wincmd w<CR>

" ensure cursor moves in both files simultaneously
map <Down> <Down><C-w><C-w><Down><C-w><C-w>
map <Up> <Up><C-w><C-w><Up><C-w><C-w>
" allow shift-arrows for independent moving
noremap <S-Down> <Down>
noremap <S-Up> <Up>

" insertion of whitespace at the end of lines left or right
" this aux whitespace is good to ensure that both left and right lines are
" equally long and wrap equally
" First the two-column version, left/right arrows
map <S-Left> :1wincmd w<CR>A                         <ESC>
map <S-Right> :2wincmd w<CR>A                         <ESC>
" Then the 1 2 3 version:
map <space>1 :1wincmd w<CR>A                         <ESC>
map <space>2 :2wincmd w<CR>A                         <ESC>
map <space>3 :3wincmd w<CR>A                         <ESC>
map <space>4 :4wincmd w<CR>A                         <ESC>


" to full beg and full end of both windows
map <C-Up> :1wincmd w<CR>gg:2wincmd w<CR>gg
map <C-Down> :1wincmd w<CR>G:2wincmd w<CR>G
