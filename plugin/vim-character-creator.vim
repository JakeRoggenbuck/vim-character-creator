" sneak.vim - The missing motion
" Authors:      Jake Roggenbuck and Kevin Rockwell
" Version:      0.1
" License:      MIT

if exists('g:loaded_character_creator_plugin') || &compatible || v:version < 700
	finish
endif
let g:loaded_character_creator_plugin = 1

if !has("python3")
    echo "vim has to be compiled with +python3 to run this"
    finish
endif

let g:plugin_path = expand('<sfile>:p:h')

function! g:MyVimPlugin()
python << endpython

import os
import sys
import vim

plugin_path = vim.eval("g:plugin_path")
python_module_path = os.path.abspath('%s/../lib' % (plugin_path))
sys.path.append(python_module_path)
from mypymodule import py_vim_character_creator

endpython
endfunction

function! g:Get_Foo()
	python3 return_classes()
endfunction
