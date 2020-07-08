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
  let curline = getline('.')
  call inputsave()
  echo a:question . "\n"
  let name = input('Enter name: ')
  call inputrestore()
  echo "\n" . name
endfunction

let s:classes = ["Wizard", "Bard", "Monk"]

function g:Get_Character_Class()
	return s:classes[Role(2)]
endfunction
