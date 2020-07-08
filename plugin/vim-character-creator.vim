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
  let ans = input('Enter a number: ')
  call inputrestore()
  return ans
endfunction

let s:classes = "Barbarian:0, Bard:1, Cleric:2, Druid:3, Fighter:4, Monk:5, Paladin:6, Ranger:7, Rogue:8, Sorcerer:9, Warlock:10, Wizard:11"

let s:character_class = g:Get_User_Choice(s:classes)

echo s:character_class
