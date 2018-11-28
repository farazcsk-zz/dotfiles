" ==================================================================
" PLUGINS
" ==================================================================

" VIM-PLUG
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'trevordmiller/nova-vim'
Plug 'sheerun/vim-polyglot'
" Plug 'tpope/vim-sleuth'
Plug 'w0rp/ale'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-vinegar'
Plug 'KeyboardFire/vim-minisnip'
call plug#end()

" NOVA-VIM
colorscheme nova

" FZF
let $FZF_DEFAULT_COMMAND = 'ag --path-to-ignore ~/.ignore --hidden -g ""'
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--path-to-ignore ~/.ignore --hidden', <bang>0)

" VIM-MINISNIP
let g:minisnip_dir = '~/.snippets/'

" ALE
let g:ale_linters = {
\  'python': ['pyls'],
\  'ruby': ['rubocop'],
\  'javascript': ['eslint', 'flow'],
\  'typescript': ['tslint', 'tsserver', 'prettier'],
\}

let g:ale_fixers = {
\  'python': ['yapf', 'prettier'],
\  'ruby': ['rubocop'],
\  'javascript': ['eslint', 'prettier'],
\  'typescript': ['tslint', 'prettier'],
\  'json': ['prettier'],
\  'css': ['prettier'],
\  'markdown': ['prettier'],
\}
let g:ale_javascript_prettier_options = '--print-width 80 --single-quote --trailing-comma all'
let g:ale_completion_enabled = 1
" let g:ale_fix_on_save = 1

nnoremap gp :silent %!prettier --stdin --print-width 80 --single-quote --trailing-comma all<CR>

let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
set laststatus=2

" SHORTCUTS
let mapleader=" "
nnoremap <leader>f :FZF<cr>
nnoremap <leader>s :Ag<space>
nnoremap <leader>g :ALEGoToDefinition<cr>
nnoremap <leader>h :ALEHover<cr>
nnoremap <leader>r :ALEFindReferences<cr>
nnoremap <leader>r :Buffers<cr>
nnoremap <leader>: :History:<cr>
nnoremap <leader>e :Explore<cr>
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l


" ==================================================================
" CORE
" ==================================================================

" LINES
set number
set cursorline

" INDENTATION
set expandtab
set shiftwidth=2
set softtabstop=2
augroup PythonTabOverrides
  autocmd!
  autocmd Filetype python setlocal shiftwidth=4 softtabstop=4
augroup END

" HISTORY
" set undofile
" set undodir=~/.vim/undo_files//
" set directory=~/.vim/swap_files//
" set backupdir=~/.vim/backup_files//

" CLIPBOARD
set clipboard^=unnamed

" PERFORMANCE
set synmaxcol=200
