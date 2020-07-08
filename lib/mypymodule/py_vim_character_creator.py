classes = ["Barbarian", "Bard", "Cleric", "Druid", "Fighter", "Monk", "Paladin", "Ranger", "Rogue", "Sorcerer", "Warlock", "Wizard"]

race = ["Dragonborn", "Dwarf", "Elf", "Gnome", "Half-Elf", "Halfling", "Half-Orc", "Human", "Tiefling", "Orc of Exandria", "Leonin", "Satyr", "Aarakocra", "Genasi", "Goliath", "Aasimar", "Bugbear", "Firbolg", "Goblin", "Hobgoblin", "Kenku", "Kobold", "Lizardfolk", "Orc", "Tabaxi", "Triton", "Yuan-ti Pureblood", "Feral Tiefling", "Torle", "Changeling", "Kalashtar", "Orc of Eberron", "Shifter", "Warforged", "Gith", "Centaur", "Loxodon", "Minotaur", "Simic Hybrid", "Vedalken", "Verdan", "Locathah"]

melee_fumble = [
        "1-2. Weapon Break. The force of your blow, or parrying that of your opponent’s, causes your weapon to snap in two. (For magical weapons roll an additional d10, on a 1 they break).",
        "3-4. Goodbye Fair Blade! Roll an Strength / Athletics check DC 15, or your weapon flies d12 feet out of your hand in a random direction. If you have any movement and a bonus action left you can go and pick it up. In doing so you provoke an opportunity attack from anyone in the area, starting with your most immediate opponent. (Otherwise you could simply draw a second weapon, if you have one, using a bonus action).",
        "5-6. Wild Swing. You overextend yourself going for the kill. Your opponent gains advantage on their next attack roll.",
        "7. Stuck Weapon. Your weapon gets stuck in your opponent’s shield, armour, hide, or else in a tree or wall, or the ground. Roll a Strength check to see if you can free it using a bonus action. The DC is 8 + your strength modifier.",
        "8. Ooops! You hit an unintended foe in combat. Randomise all combatants within 5 feet and roll a second attack roll, if you beat their armour class roll damage as if they were your intended target. (Discount sneak attack damage for Rogues).",
        "9. Self Inflicted wound. You manage to slice yourself with your own blade, roll normal damage and half it. (Applies to combatants using slashing weapons and flails only. Other weapon types roll again. Discount sneak attack damage for Rogues).",
        "10-14. Slip Up. You lose your footing. Roll Dexterity / Acrobatics check (DC15) or fall prone. Your turn has ended and melee attacks have advantage on you (see p292 of PH for conditions of being prone).",
        "15. Pulled Muscle (Arms). Roll a Constitution Saving Throw DC15 or the strain of your attack causes you to pull a muscle in your upper body. You have disadvantage in attack rolls and ability checks requiring upper body strength until you have completed three long rests, or received magical healing.",
        "16. Pulled Muscle (Legs). Roll a Constitution Saving Throw DC15 or the strain of combat causes you to pull a muscle in your leg. Your movement is halved, and you lose your dex modifier to AC and initiative, and you have disadvantage on any ability checks that require lower body strength, until you have completed three long rests, or received magical healing.",
        "17-18. Loss of Nerve. Man your opponent looks tough. Make a Wisdom Saving Throw with a base DC of 10 modified by +2 for every hit dice higher than you your opponent has (or -2 for every hit dice less). On a fail you are frightened (see p292 of Player’s Handbook). After one turn you can attempt the saving throw again.",
        "19. Broken Item. In the hurly burly of combat, something fragile – like a magic potion – you’re carrying breaks. Randomise fragile objects you have in your possession and roll to determine which. (Note, better to do this when the combat is over).",
        "20. A Little Accident. Either through fear, excitement or simply needing to go, you soil yourself. 75% chance it’s only pee.",]

def return_classes():
    for i, x in enumerate(classes):
        print(f"{x}:{i}")
def return_races():
    for i, x in enumerate(race):
        print(f"{x}:{i}")
