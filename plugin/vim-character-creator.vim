" sneak.vim - The missing motion
" Authors:      Jake Roggenbuck and Kevin Rockwell
" Version:      0.1
" License:      MIT

if exists('g:loaded_character_creator_plugin') || &compatible || v:version < 700
	finish
endif
let g:loaded_character_creator_plugin = 1

function g:Get_Foo()
	python3 << EOF
		import vim_character_creator
		vim_character_creator.return_classes()
		vim_character_creator.return_race()
	EOF
endfunction
