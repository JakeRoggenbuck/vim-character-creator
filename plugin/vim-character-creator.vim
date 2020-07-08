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

function g:Get_Foo()
	python3 import vim_character_creator
	python3 return_classes()
endfunction
