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
	\ "CHA":1}

let g:character_attr = {
	\ "STR":1,
	\ "DEX":0,
	\ "CON":0,
	\ "INT":3,
	\ "WIS":3,
	\ "CHA":1}

let g:character_skills = {
	\ "Character_Athletics": character_attr["STR"],
	\ "Acrobatics": character_attr["DEX"],
	\ "Sleight_of_Hand": character_attr["DEX"],
	\ "Stealth": character_attr["DEX"],
	\ "Arcana": saving_throws["INT"],
	\ "History": saving_throws["INT"],
	\ "Investigation": saving_throws["INT"],
	\ "Nature": character_attr["INT"],
	\ "Religion": character_attr["INT"],
	\ "Animal_Handling": character_attr["WIS"],
	\ "Insight": saving_throws["WIS"],
	\ "Medicine": character_attr["WIS"],
	\ "Perception": character_attr["WIS"],
	\ "Survival": character_attr["WIS"],
	\ "Deception": character_attr["CHA"],
	\ "Intimidation": character_attr["CHA"],
	\ "Performance": character_attr["CHA"],
	\ "Persuasion": character_attr["CHA"]}

let s:checks = ["Athletics", "Acrobatics", "Sleight of Hand", "Stealth", "Arcana", "History", "Investigation",
			 \"Nature", "Religion", "Animal Handling", "Insight", "Medicine", "Perception", "Survival",
			 \"Deception", "Intimidation", "Performance", "Persuasion"]

function g:Character_Skill_Check(check)
	if type(a:check) == 1
		if get(g:character_skills, a:check, "NONE") != "NONE"
			let prof_ = get(g:character_skills, a:check)
			let rand_command = 'import random;role1=random.randint(1,20);role2=random.randint(1,20);print(f" Role:[{role1 + ' . prof_ . '}, {role2 + ' . prof_ . '}] Nat:({role1},{role2})")'
			let rand = system("python -c '" . rand_command . "'")
			echo "Adv:" . prof_ . rand
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
