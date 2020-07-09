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
	let decisions = ["Is a goliath heavy?", "yes", "How many gold pieces we talkin?",
					\"likely not", "Id rather be a wizard with only melee weapons"]
	let rand = system("python -c 'import random;print(random.randint(0, 4))'")
	return decisions[rand]
endfunction

let g:saving_throws = {
	\ "STR":1,
    \ "DEX":0,
    \ "CON":0,
    \ "INT":6,
    \ "WIS":6,
    \ "CHA":1
}

let g:character_attr = {
	\ "STR":1,
	\ "DEX":0,
	\ "CON":0,
	\ "INT":3,
	\ "WIS":3,
	\ "CHA":1
}

let g:character_skills = {
	\ "Character_Athletics": saving_throws["STR"] / 2,
	\ "Acrobatics": saving_throws["DEX"] / 2,
	\ "Sleight_of_Hand": saving_throws["DEX"] / 2,
	\ "Stealth": saving_throws["DEX"] / 2,
	\ "Arcana": saving_throws["INT"] / 1,
	\ "History": saving_throws["INT"] / 1,
	\ "Investigation": saving_throws["INT"] / 1,
	\ "Nature": saving_throws["INT"] / 2,
	\ "Religion": saving_throws["INT"] / 2,
	\ "Animal_Handling": saving_throws["WIS"] / 2,
	\ "Insight": saving_throws["WIS"] / 1,
	\ "Medicine": saving_throws["WIS"] / 2,
	\ "Perception": saving_throws["WIS"] / 2,
	\ "Survival": saving_throws["WIS"] / 2,
	\ "Deception": saving_throws["CHA"] / 2,
	\ "Intimidation": saving_throws["CHA"] / 2,
	\ "Performance": saving_throws["CHA"] / 2,
	\ "Persuasion": saving_throws["CHA"] / 2
}

let s:checks = ["Athletics", "Acrobatics", "Sleight of Hand", "Stealth", "Arcana", "History", "Investigation",
			 \"Nature", "Religion", "Animal Handling", "Insight", "Medicine", "Perception", "Survival",
			 \"Deception", "Intimidation", "Performance", "Persuasion"]

function g:Character_Skill_Check(check)
	if type(a:check) == 1
		if get(g:character_skills, a:check, "NONE") != "NONE"
			let max = 20 + get(g:character_skills, a:check)
			let rand_command = 'import random;print(f"[{random.randint(0,' . max . ')}, {random.randint(0,' . max . ')}]")'
			let rand = system("python -c '" . rand_command . "'")
			echo "Adv " . get(g:character_skills, a:check) . "| Rand " . rand
		else
			echo s:checks
		endif	
	endif
endfunction

function g:Character_Creator_Help()
	echo "Role: role dice in vim"
	echo "Example: run ':echo Character_Creator_Roll('1d8')'"
	echo "Options: have the number of dice before the 'd' and the dice value after"
endfunction
