-- Set options
vim.opt.spell = true
vim.opt.spelllang = { 'en_us' }
vim.opt.undofile = true
vim.opt.encoding = 'utf-8'
vim.opt.clipboard = 'unnamedplus'
vim.opt.ignorecase = true
vim.opt.number = true
vim.opt.conceallevel = 1
vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 2
vim.opt.tabstop = 4
vim.opt.history = 1000
vim.opt.mmp = 5000
vim.opt.undodir = vim.fn.expand('~/.config/nvim/undodir')
vim.opt.foldmethod = 'indent'
vim.opt.foldlevel = 99
vim.opt.mouse = 'a'
vim.opt.mousehide = true
vim.opt.iskeyword:remove('_')

vim.g.pymode_python = 'python3'
vim.g.pymode_run = 1
vim.g.pymode_options_max_line_length = 88
vim.g.pymode_lint_options_pep8 = { max_line_length = vim.g.pymode_options_max_line_length }
vim.g.pymode_options_colorcolumn = 1

vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_compiler_method = 'latexmk'
vim.g.maplocalleader = ','
vim.g.mapleader = ','

-- Key mappings
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true })
vim.api.nvim_set_keymap('v', '.', ':normal .<CR>', { noremap = true })

-- Auto commands
vim.cmd([[
  autocmd BufEnter * lcd %:p:h
  autocmd FileType tex let g:syntastic_tex_lacheck_quiet_messages = { 'regex': '\Vpossible unwanted space at' }
]])

-- Load the colorscheme
vim.cmd('colorscheme dracula')

-- Treesitter configuration
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  sync_install = false,
  auto_install = true,
  ignore_install = { "tree-sitter-phpdoc", "phpdoc" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

-- COQ settings
vim.g.coq_settings = {
  keymap = { recommended = false },
  auto_start = 'shut-up',
  clients = {
    tmux = { enabled = false },
  },
}

-- Lazy.nvim setup
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  print("Installing lazy.nvim....")
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- Dracula theme
  {
    'dracula/vim',
    as = 'dracula',
    config = function()
      vim.cmd('colorscheme dracula')
    end,
  },
  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },
  -- Tsuquyomi for TypeScript
  'Quramy/tsuquyomi',
  -- Startify
  'mhinz/vim-startify',
  -- Vim Airline
  {
    'vim-airline/vim-airline',
    dependencies = { 'vim-airline/vim-airline-themes' },
  },
  -- Solidity plugins
  'thesis/vim-solidity',
  'sohkai/syntastic-local-solhint',
  'dmdque/solidity.vim',
  -- ALE (Asynchronous Lint Engine)
  'dense-analysis/ale',
  -- Vim Polyglot
  'sheerun/vim-polyglot',
  -- VimTeX
  'lervag/vimtex',
  -- Markdown Preview
  {
    'iamcco/markdown-preview.nvim',
    build = 'cd app && yarn install',
    ft = { 'markdown' },
  },
  -- COQ (Auto-completion)
  {
    'ms-jpq/coq_nvim',
    branch = 'coq',
    dependencies = {
      { 'ms-jpq/coq.artifacts',  branch = 'artifacts' },
      { 'ms-jpq/coq.thirdparty', branch = '3p' },
    },
  },
  -- Additional dependencies
  'stevearc/dressing.nvim',
  'nvim-lua/plenary.nvim',
  'MunifTanjim/nui.nvim',
  'nvim-tree/nvim-web-devicons',
  'HakonHarnes/img-clip.nvim',
  -- Copilot
  'zbirenbaum/copilot.lua',
  -- Avante
  {
    'yetone/avante.nvim',
    build = function()
      vim.cmd('silent! call avante#build()')
    end,
    cmd = 'AvanteAsk',
  },
})

-- ALE configuration
vim.g.ale_fixers = {
  ['*']         = { 'remove_trailing_lines', 'trim_whitespace' },
  javascript    = { 'prettier', 'eslint' },
  typescript    = { 'prettier', 'eslint' },
  css           = { 'prettier' },
  yaml          = { 'prettier' },
  json          = { 'prettier' },
  html          = { 'prettier' },
  docker        = { 'hadolint' },
  python        = { 'ruff', 'black' },
  bash          = { 'shfmt' },
}

vim.g.ale_linters = {
  ['*']         = { 'remove_trailing_lines', 'trim_whitespace' },
  javascript    = { 'prettier', 'eslint' },
  typescript    = { 'prettier', 'eslint' },
  css           = { 'prettier' },
  yaml          = { 'prettier' },
  json          = { 'prettier' },
  html          = { 'prettier' },
  docker        = { 'hadolint' },
  python        = { 'ruff', 'black', 'pyright' },
  solidity      = { 'solhint', 'solium' },
  bash          = { 'shfmt' },
  tex           = { 'chktex', 'lacheck' },
  latex         = { 'chktex', 'lacheck' },
}

vim.g.ale_fix_on_save = 1
vim.g.ale_lint_on_save = 1
vim.g.ale_completion_tsserver_autoimport = 1
vim.g.ale_completion_enabled = 1
vim.g['airline#extensions#ale#enabled'] = 1

-- Fold settings
vim.opt.foldmethod = 'indent'
vim.opt.foldlevel = 99

-- Mouse settings
vim.opt.mouse = 'a'
vim.opt.mousehide = true

-- netrw settings
vim.g.netrw_rmf_cmd = 'safe-delete HOSTNAME'

-- Filetype settings
vim.cmd([[
  filetype plugin indent on
  syntax enable
]])


