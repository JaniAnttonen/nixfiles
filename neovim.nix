# Neovim settings

{ config, lib, pkgs, ... }:

# let customPlugins = {
#     github-nvim-theme = pkgs.vimUtils.buildVimPlugin {
#         name = "github-nvim-theme";
#         src = pkgs.fetchgit {
#             url = "https://github.com/projekt0n/github-nvim-theme";
#         };
#     };
# };

{ programs.neovim = {
    enable = true;
    vimAlias = true;
    withNodeJs = true;
    withRuby = true;
    withPython3 = true;
    coc.enable = true;

    plugins = with pkgs.vimPlugins; [
        # Git stuff
        vim-gitgutter
        vim-fugitive

        # File browser for vim
        nerdtree
        nerdtree-git-plugin

        # Icons for different file types for nerdtree
        vim-devicons

        # Hop between vim instances in different tmux panes
        vim-tmux-navigator

        # Fuzzy finder
        fzf-vim

        # vim polyglot, a big language package
        vim-polyglot

        # LaTeX support
        vimtex

        # vim languagetool, grammar checking
        vim-grammarous

        # Color schemes
        gruvbox-material
        catppuccin-nvim

        # Visual stuff
        lightline-vim
        # lightline-gitdiff
        # lightline-ale
        # lightline-asyncrun
        
        # Coc
        coc-nvim
        coc-json
        coc-python
        coc-tsserver
        coc-rust-analyzer
        coc-vimtex

        # Distraction free writing
        goyo

        vim-test

        # Editorconfig
        editorconfig-vim

        # Linting
        vim-prettier
    ];

    extraConfig = ''
        let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
        if empty(glob(data_dir . '/autoload/plug.vim'))
            silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
            autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
        endif

        call plug#begin()
        Plug 'miguelmota/cairo.vim'
        call plug#end()

        " Run Cairo linter on save
        let g:cairo_linter_autosave = 1

        " Set true color mode
        if has('termguicolors')
            set termguicolors
        endif

        " Show line numbers
        set number

        " Hide mode since shown in lightline
        set noshowmode

        " Update opened files on change
        set autoread

        " Enable mouse use
        set mouse:a

        " Use 2 spaces for tabs
        set shiftwidth=2
        set softtabstop=2
        set expandtab

        " Show whitespace
        set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·
        set list

        " Disable swap file
        set noswapfile
        set nobackup
        set nowb

        " coc stuff
        set updatetime=300
        set cmdheight=1
        autocmd CursorHold * silent call CocActionAsync('highlight')

        " Remap autocomplete to tab without hijacking
        inoremap <expr><Tab> (pumvisible()?(empty(v:completed_item)?"\<C-n>":"\<C-y>"):"\<Tab>")
        inoremap <expr><CR> (pumvisible()?(empty(v:completed_item)?"\<CR>\<CR>":"\<C-y>"):"\<CR>")

        " Add `:Format` command to format current buffer.
        command! -nargs=0 Format :call CocAction('format')

        " Remap keys for gotos
        "nmap <silent> gd :call CocAction('jumpDefinition', 'tab drop')<CR>
        nmap <silent> gd <Plug>(coc-definition)
        nnoremap <C-LeftMouse> <Plug>(coc-definition)
        nmap <silent> gy <Plug>(coc-type-definition)
        nmap <silent> gi <Plug>(coc-implementation)
        nmap <silent> gr <Plug>(coc-references)
        nmap <silent> gn :lnext<CR>
        nmap <silent> gN :lprevious<CR>

        " Better navigation between buffers
        nnoremap <TAB> :bnext<CR>
        nnoremap <S-TAB> :bprevious<CR>

        " gh - get hint on whatever's under the cursor
        nnoremap <silent> gh :call <SID>show_documentation()<CR>
        nnoremap <silent> K :call <SID>show_documentation()<CR>

        " Inline testing
        nmap T :TestNearest<CR>

        function! s:show_documentation()
        if &filetype == 'vim'
            execute 'h '.expand('<cword>')
        else
            call CocAction('doHover')
        endif
        endfunction<Paste>

        " VSCode style Alt+j/k key mappings for moving rows up and down
        " Normal mode
        nnoremap <M-j> :m .+1<CR>==
        nnoremap <M-k> :m .-2<CR>==

        " Insert mode
        inoremap <M-j> <ESC>:m .+1<CR>==gi
        inoremap <M-k> <ESC>:m .-2<CR>==gi

        " Visual mode
        vnoremap <M-j> :m '>+1<CR>gv=gv
        vnoremap <M-k> :m '<-2<CR>gv=gv

        " Fuzzy finder with fzf and grep
        command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

        " Enable color syntax
        syntax enable

        """"" enable 24bit true color
        " If you have vim >=8.0 or Neovim >= 0.1.5
        if exists('+termguicolors')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
        set termguicolors
        endif

        " For Neovim 0.1.3 and 0.1.4
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1

        " Color scheme
        set background=dark
        colorscheme catppuccin

        " Catppuccin color scheme
        let g:catppuccin_flavour = "dusk"

        " Nerd tree settings
        let NERDTreeShowHidden=1
        let NERDTreeMinimalUI = 1

        " Minimap settings
        let g:minimap_auto_start = 1
        let g:minimap_auto_start_win_enter = 1

        " Scrollbar settings
        augroup ScrollbarInit
        autocmd!
        autocmd CursorMoved,VimResized,QuitPre * silent! lua require('scrollbar').show()
        autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
        autocmd WinLeave,FocusLost             * silent! lua require('scrollbar').clear()
        augroup end

        " TexLive with vimtex
        let g:vimtex_view_general_viewer = 'sumatraPDF'
        let g:vimtex_view_general_options = '-reuse-instance @pdf'
        let g:vimtex_view_general_options_latexmk = '-reuse-instance'

        " Neovide
        let g:neovide_cursor_animation_length=0
        set guifont=Hack\ Nerd\ Font:h14 

        set winaltkeys=yes
        for s:char in split('¶¡@£$€¥{[]}\±{}þ←đŋ©®ł¸~æœ€↓→ðħŧłß̣̣̣´|·@©ĸ»”µł“«', '\zs')
            if s:char == '\'
                let s:expr = 'imap <M-Bslash> <Bslash>'
            elseif s:char == '|'
                let s:expr = 'imap <M-Bar> <Bar>'
            else
                let s:expr = printf('imap <M-%s> %s', s:char, s:char)
            endif
            exec s:expr
        endfor

        " Nerd tree toggle
        nmap <silent> f :NERDTreeToggle<CR>

        " Lightline settings
        let g:lightline = {
            \ 'colorscheme': 'catppuccin',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
            \ },
            \ 'component_function': {
            \   'gitbranch': 'FugitiveHead'
            \ },
            \ }
        '';
    };
}
