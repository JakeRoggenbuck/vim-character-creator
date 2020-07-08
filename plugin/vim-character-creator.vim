" sneak.vim - The missing motion
" Authors:      Jake Roggenbuck and Kevin Rockwell 
" Version:      0.1
" License:      MIT

if exists('g:loaded_character_creator_plugin') || &compatible || v:version < 700
  finish
endif
let g:loaded_character_creator_plugin = 1

function Role(num)
	let rand = system('python -c "import random; print(random.randint(0, ' . a:num .'))"')
	return rand
endfunction

function g:Get_User_Choice(question)
	echo a:question
	let curline = getline('.')
	call inputsave()
  	let ans = input('Enter a num: ')
  	call inputrestore()
endfunction

let s:classes = "Barbarian:0, Bard:1, Cleric:2, Druid:3, Fighter:4, Monk:5, Paladin:6, Ranger:7, Rogue:8, Sorcerer:9, Warlock:10, Wizard:11"

function g:Get_Foo()
	return g:Get_User_Choice(s:classes)
endfunction
