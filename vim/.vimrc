" === Essential Configurations ===
set nocompatible                " Disable vi-compatibility mode
set mouse=a                     " Enable mouse support
set encoding=utf-8              " Set encoding to UTF-8
set number                      " Show line numbers
"set relativenumber              " Show relative numbers
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab " Set 4 spaces for a tab
set autoindent smartindent      " Smart indentation
set clipboard=unnamedplus       " Use system clipboard
set scrolloff=8                 " Keep 8 lines visible when scrolling
set wildmenu                    " Visual autocomplete for command menu
set incsearch                   " Incremental search
set hlsearch                    " Highlight search results
set ignorecase smartcase        " Case-insensitive search unless uppercase is used
set splitbelow splitright       " Force splits to open at the bottom and right
set termguicolors               " Enable 24-bit RGB colors
set background=dark             " Prefer dark background for themes
set fillchars+=eob:\            " Set Character to a blank space, effectively hiding the ~ 

" === Leader Key ===
let mapleader=" "               " Space as the leader key

" === Key Mappings ===
nnoremap <leader>th :colorscheme dracula<CR>    " Colorscheme shortcut
nnoremap <leader>e :NERDTreeFocus<CR>               " Focus on NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>                  " Toggle NERDTree

" vim-polyglot: Auto syntax highlighting for multiple languages
let g:polyglot_disabled = ['autoindent'] " Disable conflicting features if needed
"  ========================= Vim Plug =====================================
" vim-plug Begin
let data_dir = '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" load vim-plug
call plug#begin('~/.vim/plugged')

" Plugins list
Plug 'tpope/vim-sensible'

" Color Scheme - Dracula
Plug 'dracula/vim', { 'as': 'dracula' }

" File Explorer - NERDTree
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'bryanmylee/vim-colorscheme-icons'
" Markdown Distraction-Free Writing - Goyo
Plug 'junegunn/goyo.vim'

" Syntax Highlighting - vim-polyglot (alternative to Tree-sitter)
Plug 'sheerun/vim-polyglot'

" LSP Support - vim-lsp (alternative to Mason and nvim-lspconfig)
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
call plug#end()

" === Plugin Configurations ===

" Colorscheme Setup
colorscheme dracula

" NERDTree Configurations
let g:NERDTreeQuitOnOpen=1       " Close NERDTree after opening a file
let NERDTreeShowHidden=1        " Show hidden files
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrowExpandable='▸'
let g:NERDTreeDirArrowCollapsible='▾'

" 
let g:webdevicons_enable_nerdtree = 1
" Goyo Setup for Distraction-Free Mode
autocmd FileType markdown nnoremap <leader>md :Goyo<CR>



" vim-lsp Configuration
augroup lsp
  autocmd!
  autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
augroup END

" === Custom Functions ===
" Function to Toggle Goyo Mode
function! ToggleGoyo()
  if exists("g:goyo_on")
    Goyo
    unlet g:goyo_on
  else
    let g:goyo_on = 1
    Goyo
  endif
endfunction
nnoremap <leader>md :call ToggleGoyo()<CR>

" === Startup Commands ===
" Open NERDTree on Vim startup if no file is specified
autocmd vimenter * if !argc() | NERDTree | endif

