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

  Plug 'b0o/schemastore.nvim'

  " themes
  Plug 'Abstract-IDE/Abstract-cs'
  Plug 'ellisonleao/gruvbox.nvim'
  Plug 'projekt0n/github-nvim-theme'
  Plug 'ayu-theme/ayu-vim'
  Plug 'sainnhe/gruvbox-material'
  " Plug 'norcalli/nvim-colorizer.lua'

  Plug 'mbbill/undotree'
  Plug 'preservim/nerdcommenter'
  Plug 'ap/vim-css-color'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'kyazdani42/nvim-web-devicons'

  Plug 'itchyny/lightline.vim'
  Plug 'romgrk/barbar.nvim'
  Plug 'lukas-reineke/indent-blankline.nvim'

  " Git Indicator 
  Plug 'airblade/vim-gitgutter'

  " Plug 'p00f/nvim-ts-rainbow'

  " Auto pair for brackets
  Plug 'jiangmiao/auto-pairs'

  Plug 'alvan/vim-closetag'

  Plug 'ryanoasis/vim-devicons'
  
  Plug 'neovim/nvim-lspconfig'
  Plug 'creativenull/diagnosticls-configs-nvim', { 'tag': 'v0.1.8' }
  Plug 'hrsh7th/nvim-compe'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'L3MON4D3/LuaSnip'

  " Neovim Tree shitter
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/nvim-treesitter-textobjects'
  " Plug 'nvim-treesitter/playground'
 
  " File Explorer
  Plug 'preservim/nerdtree'
  "
  " Telescope requirements
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'

call plug#end()

syntax enable " enable syntax highglighting
syntax on " turn on syntax highlighting
set number " set line number
set relativenumber " Show relative line numbers
set nowrap " set no soft wrap
set expandtab " set that tab will insert softabstop amount of space characters
set nowritebackup " set to never save backup                                 
set noswapfile " set no swap file 
set nobackup " set no backup file
set breakindent " set every wrapped line will continue visually indented                    
set smartindent " set smart indentation
set smartcase " set to be cas sensitive when there is capital letter, this need set incsearch to work
set incsearch " set search to be case insensitive
set hidden
set termguicolors
set noerrorbells
set nohlsearch
set shiftwidth=4 " affect amount of indentation
set scrolloff=8
set signcolumn=yes
set shortmess+=c
set isfname+=@-@
set updatetime=50
set colorcolumn=120
set tabstop=4 softtabstop=4 " set tab size
set updatetime=100 " Update sign column every quarter second
" set completeopt=menuone,noinsert,noselect

set undodir=~/.config/nvim/undodir " set undotree file directory
set undofile " set undotree to save to file


silent! call repeat#set("\<Plug>vim-surround", v:count)

" luafile ~/.config/nvim/lua-config/toggleterm.lua
" luafile ~/.config/nvim/lua-config/bash-lsp.lua
luafile ~/.config/nvim/lua-config/compe-config.lua
luafile ~/.config/nvim/lua-config/lspsaga.lua
luafile ~/.config/nvim/lua-config/barbar-setup.lua
luafile ~/.config/nvim/lua-config/barbar.lua
luafile ~/.config/nvim/lua-config/indentline.lua
luafile ~/.config/nvim/lua-config/gitgutter.lua
luafile ~/.config/nvim/lua-config/standard-config.lua
luafile ~/.config/nvim/lua-config/nerd-commenter.lua

luafile ~/.config/nvim/lua-config/json-lsp.lua
luafile ~/.config/nvim/lua-config/typescript.lua
luafile ~/.config/nvim/lua-config/python-lsp.lua
luafile ~/.config/nvim/lua-config/html.lua
luafile ~/.config/nvim/lua-config/js.lua
luafile ~/.config/nvim/lua-config/yaml.lua
luafile ~/.config/nvim/lua-config/nvim-treesitter.lua

luafile ~/.config/nvim/lua-config/lsp.lua
" luafile ~/.config/nvim/lua-config/diagnosticls.lua
luafile ~/.config/nvim/lua-config/telescope.lua
" luafile ~/.config/nvim/lua-config/colorizer-config.lua

source ~/.config/nvim/plug-config/tailwind-intellisense.vim
source ~/.config/nvim/plug-config/closetag.vim

source ~/.config/nvim/plug-config/nerdtreee.vim
source ~/.config/nvim/plug-config/powerline.vim

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

highlight link CompeDocumentation NormalFloat

" hi Identifier guifg=blue
" hi Function guifg=red

