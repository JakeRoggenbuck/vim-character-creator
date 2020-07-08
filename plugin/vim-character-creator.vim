" sneak.vim - The missing motion
" Authors:      Jake Roggenbuck and Kevin Rockwell
" Version:      0.1
" License:      MIT

if exists('g:loaded_character_creator_plugin') || &compatible || v:version < 700
	finish
endif
let g:loaded_character_creator_plugin = 1

function g:Character_Creator_Roll(dice)
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

function g:Character_Creator_Help()
	echo "Role: role a dice in vim"
	echo "Example: run ':call g:Character_Creator_Roll('1d8')'"
	echo "Options: have the number of dice before the 'd' and the dice value after"
endfunction
