" sneak.vim - The missing motion
" Authors:      Jake Roggenbuck and Kevin Rockwell 
" Version:      0.1
" License:      MIT

if exists('g:loaded_character_creator_plugin') || &compatible || v:version < 700
  finish
endif
let g:loaded_character_creator_plugin = 1

function Rand()
	let l:rand = system($(( ( RANDOM % 10 )  + 1 ))))
	return l:rand
endfunction

let s:classes = ["Wizard", "Bard", "Monk"]

function g:Get_Character_Class()
	return s:classes[Rand()]
endfunction
