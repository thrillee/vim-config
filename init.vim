" hello front end masters set path+=**

" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
set encoding=UTF-8
" Ignore files
set wildignore+=*.pyc
set wildignore+=*dists/*
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

call plug#begin("~/.config/nvim/plugged")

  Plug 'rktjmp/lush.nvim'
  Plug 'ellisonleao/gruvbox.nvim'

  Plug 'mbbill/undotree'
  Plug 'preservim/nerdcommenter'
  Plug 'ap/vim-css-color'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'preservim/nerdtree'

  Plug 'itchyny/lightline.vim'

  " Git Indicator 
  Plug 'airblade/vim-gitgutter'

  Plug 'p00f/nvim-ts-rainbow'

  " Auto pair for brackets
  Plug 'jiangmiao/auto-pairs'

  Plug 'alvan/vim-closetag'

  Plug 'ryanoasis/vim-devicons'
  Plug 'wfxr/minimap.vim'

  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-compe'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'L3MON4D3/LuaSnip'

  " Neovim Tree shitter
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/playground'

  " Telescope requirements
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'

  Plug 'akinsho/toggleterm.nvim'

  " Formatter integration
  Plug 'mhartington/formatter.nvim'

call plug#end()

syntax enable " enable syntax highglighting
syntax on " turn on syntax highlighting
set number " set line number
set relativenumber " Show relative line numbers
set nowrap " set no soft wrap
set tabstop=4 softtabstop=4 " set tab size
set shiftwidth=4 " affect amount of indentation
set expandtab " set that tab will insert softabstop amount of space characters
set nowritebackup " set to never save backup                                 
set noswapfile " set no swap file 
set nobackup " set no backup file
set breakindent " set every wrapped line will continue visually indented                    
set smartindent " set smart indentation
set smartcase " set to be cas sensitive when there is capital letter, this need set incsearch to work
set incsearch " set search to be case insensitive
set hidden
set scrolloff=8
set signcolumn=yes
set shortmess+=c
set isfname+=@-@
set termguicolors
set noerrorbells
set nohlsearch
set updatetime=50
set colorcolumn=120
" set completeopt=menuone,noinsert,noselect

set undodir=~/.config/nvim/undodir " set undotree file directory
set undofile " set undotree to save to file

" MAPPINGS
let mapleader=" "
" " Panel switching
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
" " Split panel
nnoremap <leader>v <C-w>v
nnoremap <leader>s <C-w>s
nnoremap <C-Left> :tabprevious<CR>                                                                            
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-j> :tabprevious<CR>                                                                            
nnoremap <C-k> :tabnext<CR>
" " Resize 
nnoremap <leader>hh :vertical resize -3<CR>
nnoremap <leader>ll :vertical resize +3<CR>
nnoremap <leader>kk :resize -3<CR>
nnoremap <leader>jj :resize +3<CR>

" " Open Terminal  chsh -s /bin/zsh
" nnoremap <leader>tt :vnew term://bash<CR>
set shell=/bin/zsh
nnoremap <leader>tt :vnew term://bash<CR>

" Change split for vertical to horizontal or vice versal
map <leader>tv <C-w>t<C-w>H
map <leader>tj <C-w>t<C-w>K

inoremap jk <Esc>

" " Map yanked to clipboard
vnoremap <C-c> "*y

" " Map show undo tree
nnoremap <leader>u :UndotreeShow<CR>

" EDITOR CONFIG
if (has("termguicolors"))
 set termguicolors
endif
set background=dark
colorscheme gruvbox

" Nerd Commenter
" " Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" " Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" " Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
" " Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" " Map ++ to call NERD Commenter and use iTerm key bindings 
" " to bind Ctmd+/ to ++
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

" NERD TREEE

" Lightline
function! LightlineFilename()
  return &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
        \ &filetype ==# 'unite' ? unite#get_status_string() :
        \ &filetype ==# 'vimshell' ? vimshell#get_status_string() :
        \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

let g:lightline = {
  \     'colorscheme': 'powerlineish',
  \     'active': {
  \         'left': [['mode', 'paste' ], ['gitbranch','readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype']]
  \     },
  \     'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'filename': 'LightlineFilename',
      \ },
  \ }


let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

" Use fontawesome icons as signs
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '𝌡'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'

" Update sign column every quarter second
set updatetime=200

" Jump between hunks
nmap <Leader>gn <Plug>(GitGutterNextHunk) " git next
nmap <Leader>gp <Plug>(GitGutterPrevHunk) " git previous

" TELESCOPE
" nnoremap <C-p> :Files<Cr>
"
" Find files using Telescope command-line sugar.
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fs <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <leader>ffb <cmd>Telescope file_browser<cr>
" GIT STUFFS
nnoremap <leader>fgc <cmd>Telescope git_commits<cr>
nnoremap <leader>fgb <cmd>Telescope git_branches<cr>
nnoremap <leader>fgs <cmd>Telescope git_status<cr>

silent! call repeat#set("\<Plug>vim-surround", v:count)

luafile ~/.config/nvim/lua-config/toggleterm.lua
luafile ~/.config/nvim/lua-config/telescope.lua
" luafile ~/.config/nvim/lua-config/bash-lsp.lua
luafile ~/.config/nvim/lua-config/compe-config.lua
luafile ~/.config/nvim/lua-config/lspsaga.lua
luafile ~/.config/nvim/lua-config/typescript.lua
luafile ~/.config/nvim/lua-config/python-lsp.lua
luafile ~/.config/nvim/lua-config/diagnosticls.lua

source ~/.config/nvim/plug-config/nerdtreee.vim
source ~/.config/nvim/plug-config/lsp-config.vim
source ~/.config/nvim/plug-config/nvim-treesitter.vim
source ~/.config/nvim/plug-config/tailwind-intellisense.vim
source ~/.config/nvim/plug-config/closetag.vim
source ~/.config/nvim/plug-config/minimap.vim

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

highlight link CompeDocumentation NormalFloat

