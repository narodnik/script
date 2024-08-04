call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'wellle/targets.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'Tumbler/highlightMarks'
Plug 'machakann/vim-swap'
Plug 'petRUShka/vim-sage'
Plug 'jbyuki/instant.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'kristijanhusak/orgmode.nvim'
Plug 'tomlion/vim-solidity'
Plug 'chaoren/vim-wordmotion'

call plug#end()

let g:wordmotion_mappings = {
  \ 'w' : 'z',
  \ 'e' : '<M-e>',
  \ 'b' : '<M-b>',
  \ 'ge' : 'g<M-e>',
  \ 'iw' : 'i<M-w>',
  \ 'aw' : 'a<M-w>',
  \ '<C-R><C-W>' : '<C-R><M-w>',
  \ 'W' : 'Z',
  \ 'E' : '<M-E>',
  \ 'B' : '<M-B>',
  \ 'gE' : 'g<M-E>',
  \ 'iW' : 'i<M-W>',
  \ 'aW' : 'a<M-W>',
  \ '<C-R><C-A>' : '<C-R><M-a>',
\ }
"let g:wordmotion_mappings = {
"  \ 'w' : '<M-w>',
"  \ 'e' : '<M-e>',
"  \ 'b' : '<M-b>',
"  \ 'ge' : 'g<M-e>',
"  \ 'iw' : 'i<M-w>',
"  \ 'aw' : 'a<M-w>',
"  \ '<C-R><C-W>' : '<C-R><M-w>',
"  \ 'W' : '<M-W>',
"  \ 'E' : '<M-E>',
"  \ 'B' : '<M-B>',
"  \ 'gE' : 'g<M-E>',
"  \ 'iW' : 'i<M-W>',
"  \ 'aW' : 'a<M-W>',
"  \ '<C-R><C-A>' : '<C-R><M-a>',
"\ }

" put this for sunlight conditions
"set background=light
"colorscheme PaperColor
colorscheme vim

"set background=dark
"colorscheme NeoSolarized
"let g:neosolarized_termtrans = 1

highlight Pmenu guibg=gray guifg=black

let g:instant_username = "narodnik"

" bookmarks color
let g:highlightMarks_colors = ['#422943']

highlight IndentBlanklineChar guifg=#222222 gui=nocombine

syntax on

" size of hard tabs
set ts=4
" size of soft tabs
set sw=4
" use soft tabs
set et
" treat X spaces like a tab
set sts=4

" 24 bit colors
set tgc

"map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>
set cursorline
hi CursorLine   cterm=NONE guibg=#222526
hi Folded guibg=NONE
set hlsearch

" only show line cursor for active buffer
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END
" also grey the status bar
hi StatusLine   gui=NONE guibg=#121516 guifg=#ffffff
hi StatusLineNC gui=NONE guibg=#121516 guifg=#888888
hi LineNR       guifg=#818f00
hi CursorLineNR guifg=#818f00

" auto resize splits when window resizes
autocmd VimResized * wincmd =

" For some reason it doesn't work:
"hi! WinSeparator gui=NONE guibg=#222526 cterm=NONE
"set fillchars+=vert:\ "white space at the end

"map ; :
nnoremap <Space> :
vnoremap <Space> :
" when moving up or down, don't move cursor left or right
set nostartofline

" tab to jump between brackets and braces
nnoremap <tab> %
vnoremap <tab> %

" cursor can go anywhere on screen :)
set virtualedit=all
set ruler
set splitright
set splitbelow
" persistant undo
set undofile
set undodir=/tmp
set numberwidth=3
" turn on default indent for filetype
filetype indent on
" enable mouse for resizing splits
set mouse=a
"set ttymouse=xterm2

set relativenumber
" but also show current lineno
set number

map <C-J> <C-w>j
map <C-K> <C-w>k
map <C-H> <C-w>h
map <C-L> <C-w>l

" quick recording type qq, then Q to do it
nnoremap Q @q

" remove annoying help
map <f1> <nop>

" make highlighted searches disappear
nmap <C-N> :noh <CR>
imap <f1> <nop>

" disable bad habit
inoremap <DOWN> <nop>
inoremap <UP> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" scroll buffer without moving cursor
nnoremap <DOWN> <C-E>
nnoremap <UP> <C-Y>
nnoremap <left> <nop>
nnoremap <right> <nop>

" peek up/down
nnoremap <pageup> zb5<c-e>
nnoremap <pagedown> zt5<c-y>
nnoremap <end> zz

" 80 chars max
set tw=80
"autocmd FileType text setlocal tw=0
"autocmd FileType markdown setlocal tw=0
"autocmd FileType rst setlocal tw=0
" see colorcolumn
set cc=+1
hi ColorColumn guibg=black

" completion to be like bash
set wildmode=list:longest

" do not continue comments when I press enter
set formatoptions-=cro
" motherfucker vim plugins overwrites that
au FileType * set fo-=c fo-=r fo-=o

" use arrow keys to switch buffers
map <right> :tabn<cr>
map <left> :tabp<cr>
" speed up esc
set ttimeoutlen=50

" jump to end and start of lines shortcuts
no 0 ^
no - $

" type ,X to insert single char X
" saves an extra keystroke
nmap , i_<Esc>r

" set my leader to backspace
let mapleader="\<bs>"

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

nnoremap <leader>l :lcd %:p:h<cr>
nnoremap <leader>h :lcd ..<cr>
nnoremap <leader>p :pwd<cr>

" replace word under cursor with current yank. Good for replacing fn names
nnoremap <leader>q "_dwP
" delete function body
nnoremap <leader>D Vk$%k"_d

" highlight first N chars
nnoremap <leader>S /\%^\_.\{274}/e<cr>

" use escape in the terminal
au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
" when opening new terminal, auto enter insert mode
autocmd TermOpen * startinsert
" when switching to terminal, automatically enter insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" map keys to switch out of terminal
tnoremap <C-J> <C-\><C-n><C-w>j
tnoremap <C-K> <C-\><C-n><C-w>k
tnoremap <C-H> <C-\><C-n><C-w>h
tnoremap <C-L> <C-\><C-n><C-w>l

" live preview of substitutions
set icm=nosplit
" no need to specify /g for every regex substitution
set gdefault

" open files relative to current buffer
"set autochdir

" show files in normal style like file browser
let g:netrw_liststyle = 2
" no banner for file browser!
let g:netrw_banner = 0
" hide dot files
let ghregex='\(^\|\s\s\)\zs\.\S\+'
let g:netrw_list_hide=ghregex

" reload my marks when i load a new file
let g:mwAutoLoadMarks=1

" disable annoying grey column on left opened by CoC
set signcolumn=no

" hide noisy symbols
hi NoisySymbols guifg=#aaaaaa
autocmd FileType rust syn match NoisySymbols '[;{}\[\]:(),]'

au BufNewFile,BufReadPost *.zk setlocal syntax=zk
au BufNewFile,BufReadPost *.wat setlocal filetype=wast

" useful with entr, for example recompile
" echo /tmp/f5 | entr -nrs "cargo run --release"
map <F5> :!touch /tmp/f5<cr><cr>

function Lz(tag)
    if a:tag == "."
        exe "lcd %:p:h"
    else
        let l:path = system("zorten.sh " . a:tag)
        exe "lcd " . l:path
    endif
endfunction
command -nargs=1 Z :call Lz(<q-args>)
cabbrev z Z

dig a: 120094 b: 120095 c: 120096 p: 120109 in 8712 (< 8842
dig ni 8713 (! 8840 :. 183 ** 215 i8 8734
dig ff 120601 !/ 8740 ll 8467 oo 8728 !3 8802
dig o+ 8853 o* 8855 O: 10753 :: 8942 +: 8721 *: 8719 ~~ 8764 => 10233 << 10232
dig U: 8899 _L 10178
" use ⟨ instead of 〈and ⟩ instead of 〉
dig </ 10216 /> 10217
" add an overline
dig bb 773 <= 8804 ?= 8799
" use <===> as opposed to short <=>
dig == 10234

" superscripts
dig ^0 8304 ^1 185 ^2 178 ^3 179 ^4 8308 ^5 8309 ^6 8310 ^7 8311
dig ^8 8312 ^9 8313 ^a 7491 ^b 7495 ^c 7580 ^d 7496 ^e 7497 ^f 7584
dig ^g 7501 ^h 688 ^i 8305 ^j 690 ^k 7503 ^l 737 ^m 7504 ^n 8319
dig ^o 7506 ^p 7510 ^q 67493 ^r 691 ^s 738 ^t 7511 ^u 7512 ^v 7515 ^w 695
dig ^x 739 ^y 696 ^z 7611 ^+ 8314 ^- 8315 ^= 8316 ^( 8317 ^) 8318
dig ^/ 5151
dig ^A 7468 ^B 7470 ^C 42994 ^D 7472 ^E 7473 ^F 42995 ^G 7475 ^H 7476 ^I 7477 ^J 7478
dig ^K 7479 ^L 7480 ^M 7481 ^N 7482 ^O 7484 ^P 7486 ^Q 42996 ^R 7487 ^T 7488
dig ^U 7489 ^V 11389 ^W 7490 ^X 7521 ^Y 67506 ^Z 5702
" subscripts
dig _0 8320 _1 8321 _2 8322 _3 8323 _4 8324 _5 8325 _6 8326 _7 8327
dig _8 8328 _9 8329 _+ 8330 _- 8331 _= 8332 _( 8333 _) 8334
dig _a 8336 _e 8337 _h 8341 _i 7522 _j 11388 _k 8342 _l 8343 _m 8344
dig _n 8345 _o 8338 _p 8346 _r 7523 _s 8347 _t 8348 _u 7524 _v 7525 _x 8339
" vectors
dig vA 119808 vB 119809 vC 119810 vD 119811 vE 119812 vF 119813 vG 119814
dig vH 119815 vI 119816 vJ 119817 vK 119818 vL 119819 vM 119820 vN 119821
dig vO 119822 vP 119823 vQ 119824 vR 119825 vS 119826 vT 119827 vU 119828
dig vV 119829 vW 119830 vX 119831 vY 119832 vZ 119833 va 119834 vb 119835
dig vc 119836 vd 119837 ve 119838 vf 119839 vg 119840 vh 119841 vi 119842
dig vj 119843 vk 119844 vl 119845 vm 119846 vn 119847 vo 119848 vp 119849
dig vq 119850 vr 119851 vs 119852 vt 119853 vu 119854 vv 119855 vw 119856
dig vx 119857 vy 119858 vz 119859
dig v0 120782
" mathcal
dig cA 119964 cC 119966 cD 119967 cG 119970 cJ 119973 cK 119974 cN 119977 cO 119978 cP 119979 cQ 119980 cS 119982 cT 119983 cU 119984 cV 119985 cW 119986 cX 119987 cY 119988 cZ 119989
dig cH 8459 cI 8464 cL 8466 cR 8475 cB 8492 cE 8496 cF 8497
dig cB 8492 cM 8499
" mathbb
dig 00 120792 11 120793 22 120794 33 120795 44 120796 55 120797 66 120798 77 120799 88 120800 99 120801
dig AA 120120 BB 120121 DD 120123 EE 120124 FF 120125 GG 120126 II 120128 JJ 120129 KK 120130 LL 120131 MM 120132 OO 120134 SS 120138 TT 120139 UU 120140 VV 120141 WW 120142 XX 120143 YY 120144
dig CC 8450 HH 8461 NN 8469 PP 8473 QQ 8474 RR 8477 ZZ 8484 
dig e> 8608 m> 8611 \/ 8595 i> 8618

lua << EOF

-- Restore cursor position
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    pattern = { "*" },
    callback = function()
        vim.api.nvim_exec('silent! normal! g`"zv', false)
        vim.fn.feedkeys("zz0")
    end,
})

function exists(file)
    local f = io.open(file)
    return f and io.close(f)
end

function gitcheck(first_dir)
    --local objects = {}
    --local i = 1
    local dir = first_dir
    while #dir > 0 and not exists(dir .. "/.git") do
        dir = dir:gsub("/+[^/]*$", "")
        --objects[i] = dir
        --i = i + 1
    end
    -- repeat one more final step
    dir = dir:gsub("/+[^/]*$", "")

    if #dir == 0 then
        return false
    end

    local relative_path = first_dir:gsub(
        dir:gsub("(%W)","%%%1").."/",
        ""
    )
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    local refpath = relative_path .. ":" .. row
    return refpath
end

function yank_coderef()
    local refpath = gitcheck(vim.api.nvim_buf_get_name(0))
    vim.fn.setreg('+', refpath, "l")
end
-- yank code reference
vim.api.nvim_set_keymap('n', '<leader>r', ':lua yank_coderef()<CR>', { noremap = true, silent = true })

EOF

