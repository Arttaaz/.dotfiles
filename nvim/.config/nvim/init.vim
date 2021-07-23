lua require("plugins")
lua require("misc")
lua require("tree_sitter")
lua require("lsp")
lua require("completion")
lua require("statusline")

set termguicolors
colorscheme one-nvim
set number
set tabstop=4
set shiftwidth=4
set ai
set scrolloff=7
set signcolumn=yes
set cmdheight=2
set hidden

let g:tex_flavor = "latex"

set completeopt=menuone,noselect

let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_fileTypeExclude = ['markdown', 'json']

let g:grammalecte_cli_py = "/usr/bin/grammalecte-cli"
let latex_ignore = "typo_guillemets_typographiques_simples_doubles_ouvrants
	\ typo_guillemets_typographiques_simples_doubles_fermants
	\ esp_milieu_ligne"
let g:grammalecte_disable_rules = "apostrophe_typographique
	\ apostrophe_typographique_après_t
    \ espaces_début_ligne espaces_milieu_ligne
    \ espaces_fin_de_ligne
    \ typo_points_suspension1
    \ typo_tiret_incise
    \ nbsp_avant_double_ponctuation
    \ nbsp_avant_deux_points
    \ nbsp_après_chevrons_ouvrants
    \ nbsp_avant_chevrons_fermants1
    \ unit_nbsp_avant_unités1
    \ unit_nbsp_avant_unités2
    \ unit_nbsp_avant_unités3 
    \ typo_espace_manquant_après2" . latex_ignore

let g:languagetool_cmd='/usr/bin/languagetool'
let g:languagetool_lang="fr"

inoremap <silent><expr> <CR>      compe#confirm('<CR>')

nnoremap <silent> bp <cmd>Telescope buffers<CR>
nnoremap <silent> ca <cmd>Telescope lsp_code_actions<CR>
nnoremap <silent> gr <cmd>Telescope lsp_references<CR>
nnoremap <silent> gW <cmd>Telescope lsp_workspace_symbols<CR>
nnoremap <silent> gF <cmd>Telescope lsp_document_symbols<CR>
nnoremap <silent> ft <cmd>Telescope file_browser<CR>
nnoremap <silent> ge <cmd>Telescope lsp_document_diagnostics<CR>
nnoremap <silent> mn <cmd>Telescope man_pages sections=1,3,5<CR>
nnoremap <silent> fg <cmd>Telescope git_files<CR>
nnoremap <silent> K  <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> ff <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> <C-s> <cmd>Telescope spell_suggest<CR>

nnoremap <silent> mk <cmd>Telescope keymaps<CR>
command SpellFr setlocal spell spelllang=fr

autocmd BufNewFile,BufRead *.nix set ft=nix

"syntax enable
filetype plugin indent on
set omnifunc=v:lua.vim.lsp.omnifunc

set updatetime=300
"autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
"autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
autocmd CursorHold,CursorHoldI *.rs :lua require'lsp_extensions'.inlay_hints{}

"auto open nerdtree when vim opens a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

nnoremap <C-Down> :m .+1<CR>==
nnoremap <C-Up> :m .-2<CR>==
inoremap <C-Down> <Esc>:m .+1<CR>==gi
inoremap <C-Up> <Esc>:m .-2<CR>==gi
vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <C-Up> :m '<-2<CR>gv=gv

let g:VM_maps = {}
let g:VM_maps["Move Right"] = '<C-S-Right>'
let g:VM_maps["Move Left"] = '<C-S-Left>'
