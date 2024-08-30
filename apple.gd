extends Sprite2D


# ここはじぶんのメモを書いても良いよ
#func _ready():
	##pass
	#var apple
	#apple=3
	#print(apple)

var apple: int = 0
var upgrade_apple_tree: int = 0
var apple_per_sec: int = 0
var apple_per_click: int = 1
@onready var label: Label = get_parent().get_node("appletext")

func _ready():
	while true:
		await get_tree().create_timer(1).timeout
		apple += apple_per_sec
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	label.text = str(apple) + " apples"

func _input(event):
	if event is InputEventMouseButton:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			apple += apple_per_click
			print(apple)


func _on_button_pressed():
	pass # Replace with function body.
	if apple >= 10:
		apple_per_sec += 5
		upgrade_apple_tree += 1

		var buy_button: Button = get_parent().get_node("Button")
		buy_button.text = "リンゴの木　x "+ str(upgrade_apple_tree) +"\n(10 apples)"


func _on_button_2_pressed():
	if apple >= 100:
		apple -= 100
		apple_per_click += 1
	
	var buy_button: Button = get_parent().get_node("Button2")
	buy_button.text = "クリックパワー x "+ str(apple_per_click)+"\n(100 apples)"
