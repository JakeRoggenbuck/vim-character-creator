" sneak.vim - The missing motion
" Authors:      Jake Roggenbuck and Kevin Rockwell
" Version:      0.1
" License:      MIT

if exists('g:loaded_character_creator_plugin') || &compatible || v:version < 700
	finish
endif
let g:loaded_character_creator_plugin = 1

" ./plugin/my-vim-plugin.vim
function! MyVimPlugin()
python << endpython

import vim

vim.command("let a:plugin_path = expand('<sfile>:p:h')
plugin_path = vim.eval("a:plugin_path")
print plugin_path

endpython
endfunction
