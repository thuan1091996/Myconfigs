" Plugins will be downloaded under the specified directory.
call plug#begin('~/.local/share/nvim/site/autoload/plugged')
" Declare the list of plugins.
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'codota/tabnine-vim'
Plug 'cdelledonne/vim-cmake'
Plug 'voldikss/vim-floaterm'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Tab configuration
set tabstop=4
set shiftwidth=4

"FLOATERM key mapping

let g:floaterm_keymap_toggle = '<F5>'
nmap <F6> : :FloatermNew --position=bottom --wintype=split --autoclose=1 <cr>
let g:floaterm_keymap_new    = '<F7>' 
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
tmap <F6> <C-d><cr>
nmap <C-r> :NERDTreeRefreshRoot<cr>
