runtime! archlinux.vim
lua require('plugins')

""""""""""""""""""""

" Absolute number on current line, relative on others
set number
set relativenumber

set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
filetype plugin indent on

set ignorecase
set smartcase

set mouse=a
set cmdheight=1
set hidden		" Don't close files when a new buffer is opened
set nocursorline	" Supposedly helps performance
set timeoutlen=200	" Leader key timeout
set updatetime=300	" Time after typing stops before triggering related plugins
set spelllang=en
set spellsuggest=best,9
set signcolumn=yes

""""""""""""""""""""

let mapleader=" "
inoremap  <C-W>
inoremap <C-Del> <C-O>dw
nnoremap k gk
nnoremap j gj
nnoremap <Up> g<Up>
inoremap <Up> <C-O>g<Up>
nnoremap <Down> g<Down>
inoremap <Down> <C-O>g<Down>
nnoremap <Home> g<Home>
inoremap <Home> <C-O>g<Home>
nnoremap <End> g<End>
inoremap <End> <C-O>g<End>
inoremap <M-C-S-Down> <C-O>:m+1<cr>
inoremap <M-C-S-Up> <C-O>:m-2<cr>

noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-C>:update<CR>
inoremap <C-Z> <C-O>u
nnoremap <C-z> <nop>
inoremap <C-Y> <C-O><C-R>

nnoremap <silent> <F11> :set spell!<cr>
inoremap <silent> <F11> <C-O>:set spell!<cr>

noremap <C-H> :bprev<CR>
noremap <C-L> :bnext<CR>

""""""""""""""""""""

"syntax enable  " Disable with Treesitter
let base16colorspace=256
set termguicolors
hi Normal guibg=NONE ctermbg=NONE  " Force transparent bg
hi LineNr ctermbg=NONE guibg=NONE  " Force transparent gutter

""""""""""""""""""""

" Recompile Packer file
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end


lua << EOF
local wk = require("which-key")
wk.register({
	["<leader>b"]  = { name = "buffer" },
	["<leader>bk"] = { "<cmd>BufferClose<cr>", "Close Open Buffer" },
	["<leader>bw"] = { "<cmd>BD<cr>", "BufKill Close Open Buffer" },
	["<leader>bn"] = { "<cmd>enew<cr>", "Open New Buffer" },
	["<leader>b["]       = { "<cmd>bprev<cr>", "Open New Buffer" },
	["<leader>b<Left>"]  = { "<cmd>bprev<cr>", "Open New Buffer" },
	["<leader>b]"]       = { "<cmd>bnext<cr>", "Open New Buffer" },
	["<leader>b<Right>"] = { "<cmd>bnext<cr>", "Open New Buffer" },

	["<leader>w"]  = { name = "window/pane" },
	["<leader>wk"] = { "<cmd>wincmd k<cr>", "Focus Up" },
	["<leader>wj"] = { "<cmd>wincmd j<cr>", "Focus Down" },
	["<leader>wh"] = { "<cmd>wincmd h<cr>", "Focus Left" },
	["<leader>wl"] = { "<cmd>wincmd l<cr>", "Focus Right" },
	["<leader>w<Up>"]    = { "<cmd>wincmd k<cr>", "Focus Up" },
	["<leader>w<Down>"]  = { "<cmd>wincmd j<cr>", "Focus Down" },
	["<leader>w<Left>"]  = { "<cmd>wincmd h<cr>", "Focus Left" },
	["<leader>w<Right>"] = { "<cmd>wincmd l<cr>", "Focus Right" },

	["<leader>f"]  = { name = "file" },
	["<leader>ff"] = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find Files" },
	["<leader>fr"] = { "<cmd>lua require('telescope.builtin').oldfiles()<cr>", "Recent Files" },
	["<leader>fg"] = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Grep Through Files" },

	["<leader>o"]  =  { name = "open" },
	["<leader>ot"] = { "<cmd>terminal<cr>", "Open Terminal Buffer" },
	--["<leader>om"] = { "<cmd>lua require('telescope.builtin').tags()<cr>", "Tags Search" },

	["<leader>h"] = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", "Help" },
	["<leader>."] = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find Files" },
	["<leader>,"] = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "Find Buffers" },
	["<leader>x"] = { "<cmd>lua require('telescope.builtin').commands()<cr>", "Execute Command" },
	["<leader>/"] = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", "Search Open Buffer" },
})
EOF

""""""""""""""""""""

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"
" remap for complete to use tab and <cr>
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

hi CocSearch ctermfg=12 guifg=#E0DEF4
hi CocMenuSel ctermbg=109 guibg=#191724

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>F  <Plug>(coc-format-selected)
nmap <leader>F  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
"nmap <silent> <C-s> <Plug>(coc-range-select)
"xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


""""""""""""""""""""

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'zathura'

" Or with a generic interface:
"let g:vimtex_view_general_viewer = 'okular'
"let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".
let g:vimtex_compiler_method = 'latexmk'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = " "
