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

let s:plugin_root_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')

function Roll(dice)
	"e.g. 1d4
	let nums = split('d')
	if len(nums) != 2
		return 'Invalid arguments'
	endif
	let total = 0
	let count = nums[0]
	while count > 0
		let total += :!command python -c 'import random;print(random.randint(0,' . nums[1] . '))'
		count -= 1
	endwhile
	return total
endfunction

python3 << EOF
import sys
from os.path import normpath, join
import vim
plugin_root_dir = vim.eval('s:plugin_root_dir')
python_root_dir = normpath(join(plugin_root_dir, 'python3'))
sys.path.insert(0, python_root_dir)
print(python_root_dir)
import py_vim_character_creator
EOF

function! g:Get_Foo()
	python3 py_vim_character_creator.return_classes()
endfunction
