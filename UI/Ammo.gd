extends NinePatchRect

onready var labelLeft: = $Label
onready var labelCage: = $Label3

func set_ammo(roundsLeft: int, cageSize: int):
	labelLeft.text = str(roundsLeft)
	labelCage.text = str(cageSize)
