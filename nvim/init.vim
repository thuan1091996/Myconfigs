" Plugins will be downloaded under the specified directory.
call plug#begin('~/.local/share/nvim/site/autoload/plugged')
" Declare the list of plugins.
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
" Telescope requires plenary to function
Plug 'nvim-lua/plenary.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" The main Telescope plugin
Plug 'nvim-telescope/telescope.nvim'
" An optional plugin recommended by Telescope docs
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make' }
Plug 'itchyny/lightline.vim'

Plug 'voldikss/vim-floaterm'
Plug 'neovim/nvim-lspconfig'
Plug 'alexaandru/nvim-lspupdate'
Plug 'gruvbox-community/gruvbox'
Plug 'lewis6991/gitsigns.nvim'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'folke/tokyonight.nvim'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()


" enables syntax highlighting
syntax on

" number of spaces in a <Tab>
set tabstop=4
set softtabstop=4
set expandtab

" enable autoindents
set smartindent

" number of spaces used for autoindents
set shiftwidth=4

" adds line numbers
set number

" columns used for the line number
set numberwidth=4

" highlights the matched text pattern when searching
set incsearch
set nohlsearch

" open splits intuitively
set splitright

" navigate buffers without losing unsaved work
set hidden

" start scrolling when 8 lines from top or bottom
set scrolloff=8

" Save undo history
set undofile

" Enable mouse support
set mouse=a

" case insensitive search unless capital letters are used
set ignorecase
set smartcase


"Key mapping for Itachi ****************************************************************************
vnoremap <M-/> <Esc>/\%V
vnoremap <C-f> y/\V<C-R>=escape(@",'/\')<CR><CR>
:tnoremap <Esc> <C-\><C-n>
"***************************************************************************************************

"****************************---LUA---*********************************
lua require('itachi.telescope')
lua require('itachi.lsp')
lua require('gitsigns')
"**********************************************************************

" Gruvbox -------------------------------------------------
let g:gruvbox_contrast_dark = 'soft'
colorscheme tokyonight 
"----------------------------------------------------------

"FLOATERM key mapping-------------------------------------------------
let g:floaterm_keymap_toggle = '<F5>'
nmap <F6> : :FloatermNew --position=bottom --wintype=split --autoclose=1 --height=20<cr>
let g:floaterm_keymap_new    = '<F7>' 
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
tmap <F6> <C-d><cr>
"nmap <C-r> :NERDTreeRefreshRoot<cr>
"---------------------------------------------------------------------

" Telescope config-------------------------------------------------
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" ------------------------------------------------------------------

" autocomplete config-------------------------------------------------
set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

EOF
" ------------------------------------------------------------------

"**************************************************************************************************
lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "maintained",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
"**************************************************************************************************

"*****************************************************************************************************
" lua<<EOF
" vim.g.symbols_outline = {
"     highlight_hovered_item = true,
"     show_guides = true,
"     auto_preview = true,
"     position = 'right',
"     relative_width = true,
"     width = 25,
"     auto_close = false,
"     show_numbers = false,
"     show_relative_numbers = false,
"     show_symbol_details = true,
"     preview_bg_highlight = 'Pmenu',
"     keymaps = { -- These keymaps can be a string or a table for multiple keys
"         close = {"<Esc>", "q"},
"         goto_location = "<Cr>",
"         focus_location = "o",
"         hover_symbol = "<C-space>",
"         toggle_preview = "K",
"         rename_symbol = "r",
"         code_actions = "a",
"     },
"     lsp_blacklist = {},
"     symbol_blacklist = {},
"     symbols = {
"         File = {icon = "", hl = "TSURI"},
"         Module = {icon = "", hl = "TSNamespace"},
"         Namespace = {icon = "", hl = "TSNamespace"},
"         Package = {icon = "", hl = "TSNamespace"},
"         Class = {icon = "𝓒", hl = "TSType"},
"         Method = {icon = "ƒ", hl = "TSMethod"},
"         Property = {icon = "", hl = "TSMethod"},
"         Field = {icon = "", hl = "TSField"},
"         Constructor = {icon = "", hl = "TSConstructor"},
"         Enum = {icon = "ℰ", hl = "TSType"},
"         Interface = {icon = "ﰮ", hl = "TSType"},
"         Function = {icon = "", hl = "TSFunction"},
"         Variable = {icon = "", hl = "TSConstant"},
"         Constant = {icon = "", hl = "TSConstant"},
"         String = {icon = "𝓐", hl = "TSString"},
"         Number = {icon = "#", hl = "TSNumber"},
"         Boolean = {icon = "⊨", hl = "TSBoolean"},
"         Array = {icon = "", hl = "TSConstant"},
"         Object = {icon = "⦿", hl = "TSType"},
"         Key = {icon = "🔐", hl = "TSType"},
"         Null = {icon = "NULL", hl = "TSType"},
"         EnumMember = {icon = "", hl = "TSField"},
"         Struct = {icon = "𝓢", hl = "TSType"},
"         Event = {icon = "🗲", hl = "TSType"},
"         Operator = {icon = "+", hl = "TSOperator"},
"         TypeParameter = {icon = "𝙏", hl = "TSParameter"}
"     }
" }
" EOF
"*****************************************************************************************************
"Can u see me now 
