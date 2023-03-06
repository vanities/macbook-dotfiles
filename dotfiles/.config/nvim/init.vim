set spell spelllang=en_us
set undofile
set encoding=utf-8

if has('clipboard')
  if has('unnamedplus')  " When possible use + register for copy-paste
    set clipboard=unnamed,unnamedplus
  else         " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
  endif
endif

set ignorecase
set number
set conceallevel=1
set termguicolors
set background=dark

set expandtab
set autoindent
set softtabstop=4
set shiftwidth=2
set tabstop=4

set history=1000

" https://github.com/vim/vim/issues/2049
set mmp=5000

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

colorscheme dracula

autocmd BufEnter * lcd %:p:h

filetype plugin indent on

set undodir=~/.config/nvim/undodir

" == VIM PLUG ================================
call plug#begin('~/.config/nvim/plugged')

"------------------------ VIM TSX ------------------------
" by default, if you open tsx file, neovim does not show syntax colors
" typescript-vim will do all the coloring for typescript keywords
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'leafgarland/typescript-vim'
" Plug 'peitalin/vim-jsx-typescript'

" https://github.com/Quramy/tsuquyomi
" Tsuquyomi works as a client for TSServer (which is an editor service bundled into TypeScript). So, installing Tsuquyomi, your vim gets the following features provided by TSServer
Plug 'Quramy/tsuquyomi'


" https://github.com/itchyny/lightline.vim
" bottom bar for vim showing mode and stuff
"Plug 'itchyny/lightline.vim'

" https://github.com/ctrlpvim/ctrlp.vim
" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plug 'ctrlpvim/ctrlp.vim'

" https://github.com/ycm-core/YouCompleteMe
" YouCompleteMe is a fast, as-you-type, fuzzy-search code completion engine for Vim. It has several completion engines:
" Plug 'Valloric/YouCompleteMe'

" https://github.com/vim-syntastic/syntastic
" Plug 'vim-syntastic/syntastic'
" Syntastic is a syntax checking plugin for Vim created by Martin Grenfell. It runs files through external syntax checkers and displays any resulting errors to the user. This can be done on demand, or automatically as files are saved. If syntax errors are detected, the user is notified and is happy because they didn't have to compile their code or execute their script to find them.


" https://github.com/tpope/vim-surround
" Surround.vim is all about surroundings: parentheses, brackets, quotes, XML tags, and more. The plugin provides mappings to easily delete, change and add such surroundings in pairs.
" Plug 'tpope/vim-surround'


"https://github.com/mhinz/vim-startify
"This plugin provides a start screen for Vim and Neovim.
Plug 'mhinz/vim-startify'


" https://github.com/dracula/vim
" A dark theme for Vim.
Plug 'dracula/vim', { 'as': 'dracula' }

" https://github.com/python-mode/python-mode
" Python-mode, a Python IDE for Vim
Plug 'python-mode/python-mode', { 'branch': 'develop' }

" https://github.com/neomake/neomake
" Asynchronous linting and make framework for Neovim/Vim
" Plug 'neomake/neomake'
"
" https://github.com/vim-airline/vim-airline
" Lean & mean status/tabline for vim that's light as air.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" https://github.com/tomlion/vim-solidity/
" Vim syntax file for solidity
Plug 'thesis/vim-solidity'

" https://github.com/sohkai/syntastic-local-solhint
" Prefer local repo install of solhint over global install with syntastic
Plug 'sohkai/syntastic-local-solhint'

" https://github.com/dmdque/solidity.vim
" Solidity Compiler Plugin
Plug 'dmdque/solidity.vim'

" https://github.com/RRethy/vim-hexokinase
" The fastest (Neo)Vim plugin for asynchronously displaying the colours in the file (#rrggbb, #rgb, rgb(a)? functions, hsl(a)? functions, web colours, custom patterns)
" Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" https://github.com/dense-analysis/ale
" Check syntax in Vim asynchronously and fix files, with Language Server Protocol (LSP) support
Plug 'dense-analysis/ale'

" https://github.com/sheerun/vim-polyglot
" A collection of language packs for Vim. - syntax highlighting
Plug 'sheerun/vim-polyglot'

" https://github.com/lervag/vimtex
" LaTeX plugin for vim
Plug 'lervag/vimtex'

" https://github.com/iamcco/markdown-preview.nvim
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" https://github.com/neoclide/coc.nvim
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
"
" https://github.com/ms-jpq/coq_nvim
" main one
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" 9000+ Snippets
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

" lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
" Need to **configure separately**

Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
" - shell repl
" - nvim lua api
" - scientific calculator
" - comment banner
" - etc


call plug#end()
" == VIMPLUG END ================================

" Color highlighter "
" let g:Hexokinase_highlighters = ['backgroundfull']
" All possible values
"" let g:Hexokinase_optInPatterns = [
"\     'full_hex',
"\     'triple_hex',
"\     'rgb',
"\     'rgba',
"\     'hsl',
"\     'hsla',
"\     'colour_names'
"\ ]

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'css': ['prettier'],
\   'yaml': ['prettier'],
\   'json': ['prettier'],
\   'html': ['prettier'],
\   'docker': ['hadolint'],
\   'python': ['black'],
\   'bash': ['shfmt'],
\}
let g:ale_linters = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'css': ['prettier'],
\   'yaml': ['prettier'],
\   'json': ['prettier'],
\   'html': ['prettier'],
\   'docker': ['hadolint'],
\   'python': ['black'],
\   'solidity': ['solhint', 'solium'],
\   'bash': ['shfmt'],
\}
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1
let g:ale_completion_tsserver_autoimport = 1
let g:ale_completion_enabled = 1
let g:airline#extensions#ale#enabled = 1


let g:ycm_autoclose_preview_window_after_completion=1

set foldmethod=indent
set foldlevel=99

set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing

set iskeyword-=_
let g:pymode_python = 'python3'
let g:pymode_run = 1
" Pylint configuration file
let g:pymode_options_max_line_length = 88
let g:pymode_lint_options_pep8 = {'max_line_length': g:pymode_options_max_line_length}
let g:pymode_options_colorcolumn = 1

" set filetypes as typescriptreact
" autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
" au BufNewFile,BufRead *.ts setlocal filetype=typescript
" au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

let g:ycm_auto_trigger = 1
let g:netrw_rmf_cmd = 'safe-delete HOSTNAME'


" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.
filetype plugin indent on

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
syntax enable

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'zathura'

" Or with a generic interface:
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".
let g:vimtex_compiler_method = 'latexmk'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = ","

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  sync_install = true,
  auto_install = true,
  ignore_install = {"tree-sitter-phpdoc", "phpdoc"},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
vim.g.coq_settings = {
  keymap = { recommended = false },
  auto_start = 'shut-up',
  clients = {
    tmux = { enabled = false },
  },
}
EOF
