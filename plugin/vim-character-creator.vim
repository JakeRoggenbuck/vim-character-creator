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
	echo "\n" . a:question
	let curline = getline('.')
	call inputsave()
	let name = input('Answer: ')
	return name
endfunction

let s:classes = "Barbarian:0, Bard:1, Cleric:2, Druid:3, Fighter:4, Monk:5, Paladin:6, Ranger:7, Rogue:8, Sorcerer:9, Warlock:10, Wizard:11"

let s:race = "Dragonborn:0, Dwarf:1, Elf:2, Gnome:3, Half-Elf:4, Halfling:5, Half-Orc:6, Human:7, Tiefling:8, Orc of Exandria:9, Leonin:10, Satyr:11, Aarakocra:12, Genasi:13, Goliath:14, Aasimar:15, Bugbear:16, Firbolg:17, Goblin:18, Hobgoblin:19, Kenku:20, Kobold:21, Lizardfolk:22, Orc:23, Tabaxi:24, Triton:25, Yuan-ti Pureblood:26, Feral Tiefling:27, Torle:28, Changeling:29, Kalashtar:30, Orc of Eberron:31, Shifter:32, Warforged:33, Gith:34, Centaur:35, Loxodon:36, Minotaur:37, Simic Hybrid:38, Vedalken:39, Verdan:40, Locathah:41"

function g:Get_Foo()
	let class = g:Get_User_Choice(s:classes)
	let race = g:Get_User_Choice(s:race)
	let name = g:Get_User_Choice("Name?")

	echo "\n You are a " . race . class . " named " . name
endfunction
