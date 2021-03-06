"
" reStructuredText tables plugin
" Language:     Python (ft=python)
" Maintainer:   Walter Doekes <wjdoekes+vim@osso.nl>
" Author:       Vincent Driessen <vincent@datafox.nl>
" Version:      Vim 7 (may work with lower Vim versions, but not tested)
" URL:          https://github.com/ossobv/vim-rst-tables-py3
"
" This plugin is a more flexible reimplementation of the ideas and the
" existing Vim plugin by Hugo Ruscitti:
"   http://www.vim.org/scripts/script.php?script_id=3041
"

" Only do this when not done yet for this buffer
if exists("g:loaded_rst_tables_ftplugin")
    finish
endif
let loaded_rst_tables_ftplugin = 1

if !has('python3')
    " http://www.terminally-incoherent.com/blog/2013/05/06/vriting-vim-plugins-in-python/
    echo "No python3 support (see: rst_tables.vim)"
    finish
endif

python3 << endpython
__PYTHON_SOURCE__
endpython

" Add mappings, unless the user didn't want this.
" The default mapping is registered, unless the user remapped it already.
if !exists("no_plugin_maps") && !exists("no_rst_table_maps")
    if !hasmapto('ReformatTable(')
        noremap <silent> <leader><leader>c :call ReformatTable()<CR>
    endif
    if !hasmapto('ReflowTable(')
        noremap <silent> <leader><leader>f :call ReflowTable()<CR>
    endif
endif
