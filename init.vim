call plug#begin('~/.config/nvim/plugged')
Plug 'deepl0n9/vim-arrowless' 
"----- general
Plug 'scrooloose/nerdtree' " in normal mode = <TAB> to show explorer
"----- end general
"----- colorscheme
Plug 'mhartington/oceanic-next'
Plug 'NLKNguyen/papercolor-theme'
Plug 'ap/vim-css-color'
Plug 'ayu-theme/ayu-vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
"----- end colorscheme
"----- programming
Plug 'majutsushi/tagbar' " list function or class in current buffer
Plug 'neoclide/coc.nvim',{'branch': 'release'}
Plug 'eliba2/vim-node-inspect'
Plug 'mattn/emmet-vim' " use <leader>, to trigger
Plug 'tpope/vim-markdown'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'vim-scripts/fpc.vim'
Plug 'leoluz/nvim-dap-go'
Plug 'mfussenegger/nvim-dap'
"----- end programming
"----- git plugin
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'rhysd/git-messenger.vim' " in normal mode = use gm 
"----- end git plugin
"----- feature
" motion
Plug 'yuttie/comfortable-motion.vim' " in normal mode = CTRL-D to down CTRL-U to up
" end motion
Plug 'vim-airline/vim-airline' " theme in nvim
Plug 'vim-airline/vim-airline-themes' " also them in nvim
Plug 'ryanoasis/vim-devicons' " show icons in nerdtree/explorer
Plug 'terryma/vim-multiple-cursors' " select word with v or V and use CTRL-n to next, CTRL-p to prev, CTRL-x to skip
Plug 'tomtom/tcomment_vim'  " comment code, use gc
Plug 'tpope/vim-surround'  " change pair of {, ',... in normal mode = cs -> eg. cs`' meaning : change pair of ` to '
Plug 'tpope/vim-eunuch' " use unix command inside vim --->

" vim-eunuch DOC
"
" :Delete: Delete a buffer and the file on disk simultaneously.
" :Unlink: Like :Delete, but keeps the now empty buffer.
" :Move: Rename a buffer and the file on disk simultaneously.
" :Rename: Like :Move, but relative to the current file's containing directory.
" :Chmod: Change the permissions of the current file.
" :Mkdir: Create a directory, defaulting to the parent of the current file.
" :Cfind: Run find and load the results into the quickfix list.
" :Clocate: Run locate and load the results into the quickfix list.
" :Lfind/:Llocate: Like above, but use the location list.
" :Wall: Write every open window. Handy for kicking off tools like guard.
" :SudoWrite: Write a privileged file with sudo.
" :SudoEdit: Edit a privileged file with sudo.
"
" <------
" ----- end feature
call plug#end()


"###### settings #####

"===== general
" Or if you have Neovim >= 0.1.5
set mouse=a
if (has("termguicolors"))
 set termguicolors
endif

set t_Co=256
colorscheme OceanicNext
set background=dark
let mapleader = " "
let maplocalleader = ","
" let g:airline_theme = 'dark'
map <leader>r :So<CR>
nnoremap m ^
nnoremap <silent> <localleader><space> :Rg<CR>
nnoremap <silent> <leader><Space> :GFiles<CR>
nnoremap <silent> <leader>a :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
command! Light set background=light | colorscheme papercolor
command! Dark set background=dark | colorscheme OceanicNext
command! So :so ~/.config/nvim/init.vim | echo 'Vim Reloaded'
command! Cdthis :cd %:p:h " command to change directory to current buffer
command! This :pwd
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor " command to clear register
augroup every
  autocmd!
  au InsertEnter * set norelativenumber | set cursorcolumn
  au InsertLeave * set relativenumber | set nocursorcolumn
augroup END " no number when insert 
autocmd vimenter,colorscheme * :hi indentguidesodd   ctermbg=black
autocmd vimenter,colorscheme * :hi indentguideseven  ctermbg=black
set shortmess+=c
set lazyredraw
set smartcase
set ignorecase
set formatoptions-=cro
set tw=0
set hidden
set nobackup
set nowritebackup
set signcolumn=yes
set backspace=indent,eol,start
set nocompatible
set number 
set relativenumber
set nowrap 
set shiftwidth=4
set smarttab
set title
set statusline+=%=%l:%c
set statusline=[%n]\ [%t]
set expandtab
set laststatus=2
set cursorline

"standart mapping
inoremap jj <ESC>
nnoremap Q @@
map <S-o> o<ESC>k
nnoremap <leader>f <C-w>h
nnoremap <leader>l <C-w>l
nnoremap <leader>n <C-w>j
nnoremap <leader>u <C-w>k
nnoremap <leader>; :bw<CR>
"leader
let mapleader = " "
map <leader> :
map <leader>q :q!<CR>
map <leader>w :w<CR>
map <leader>k :bnext<CR>
map <leader>j :bprev<CR>
map <leader>s :split<CR>
map <leader>v :vsplit<CR>
"localleader
"===== end general


"===== comfortable-motion.vim
nnoremap <silent> <C-d> :call comfortable_motion#flick(100)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(-100)<CR>
"===== end comfortable-motion.vim


"===== airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 1
"===== end airline


"===== fzf
" set rtp+=/usr/local/opt/fzf
" ripgrep no devicons
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5, 'highlight': 'Comment' } }
" if executable('rg')
" "  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
"   let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
"   set grepprg=rg\ --vimgrep
"   command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --ignore node_modules yarn.lock vendor --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
" endif

"===== end fzf

"===== coc
let g:python_host_prog = '$PYENV_ROOT/versions/neovim2/bin/python'
let g:python3_host_prog = '$PYENV_ROOT/versions/neovim3/bin/python'

try
    nmap <silent> [e :call CocAction('diagnosticNext')<cr>
    nmap <silent> ]e :call CocAction('diagnosticPrevious')<cr>
endtry
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

"===== end coc

"===== nerdtree
map <leader><tab> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks = 0
let NERDTreeMinimalUi = 1
let NERDTreedirArrows = 1
"===== end nerdtree


"===== markdown
let vim_markdown_preview_github=1
"Markdown to HTML
nmap <localleader>md :%!/usr/local/bin/Markdown.pl --html4tags <cr>
"===== end markdown

"==== emmet
let g:user_emmet_expandword_key = '<c-y>1'
let g:user_emmet_update_tag = '<c-y>2'
let g:user_emmet_balancetaginward_key = '<c-y>3'
let g:user_emmet_balancetagoutward_key = '<c-y>4'
let g:user_emmet_next_key = '<c-y>5'
let g:user_emmet_prev_key = '<c-y>6'
let g:user_emmet_imagesize_key = '<c-y>7'
let g:user_emmet_togglecomment_key = '<c-y>8'
let g:user_emmet_splitjointag_key = '<c-y>9'
let g:user_emmet_anchorizeurl_key = '<c-y>10'
let g:user_emmet_anchorizesummary_key = '<c-y>11'
let g:user_emmet_mergelines_key = '<c-y>12'
let g:user_emmet_codepretty_key = '<c-y>13'
let g:user_emmet_leader_key=','
"===== end emmet


"===== gitgutter
let g:gitgutter_override_sign_column_highlight = 1
let g:gitgutter_sign_removed = 'x'
set updatetime=100 " update sign colum every quarter second = default is 4000
"===== end gitgutter

"==== vim-jsx-typescript
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
" light-grey
" dark-grey
hi tsxTypes guifg=#008cff
" dark red
hi tsxTagName guifg=#E06C75
hi tsxComponentName guifg=#E06C75
hi tsxCloseComponentName guifg=#E06C75

" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxCloseTagName guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575

" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic

"==== end vim-jsx-typescript

"==== git messenger
nmap <silent> gm <Plug>(git-messenger)
"==== end git messenger

" ctags-exuberant / tagbar
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_2/bin/ctags'
nnoremap <silent> <leader>t :TagbarToggle<CR>
"lua require('dap-go').setup()

" vim-go golang jump to implements with go guru
nmap <silent> gh :GoImplements<CR>
