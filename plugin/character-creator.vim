" character-creator.vim - A simple tool to help with role playing games
" Authors:      Jake Roggenbuck and Kevin Rockwell
" Version:      0.2
" License:      MIT

if exists('g:loaded_character_creator_plugin') || &compatible || v:version < 700
	finish
endif
let g:loaded_character_creator_plugin = 1

function g:Character_Creator_Roll(dice)
	"e.g. 1d4
	let nums = split(a:dice, 'd')
	if len(nums) != 2
		return 'Invalid arguments'
	endif
	let total = 0
	let count = nums[0]
	while count > 0
		let rand = system("python -c 'import random;print(random.randint(1,'" . nums[1] . "'))'")
		echo "Role " . count . ": " . rand
		let total += rand
		let count -= 1
	endwhile
	echo total
	return total
endfunction

function g:Character_Decision()
	let decisions = ["Is a goliath heavy?", "yes", "How many gold pieces we talkin?", "likely not", "Id rather be a wizard with only melee weapons"]
	let rand = system("python -c 'import random;print(random.randint(1, 5))'")
	return decisions[rand]



function g:Character_Creator_Help()
	echo "Role: role a dice in vim"
	echo "Example: run ':echo Character_Creator_Roll('1d8')'"
	echo "Options: have the number of dice before the 'd' and the dice value after"
endfunction
