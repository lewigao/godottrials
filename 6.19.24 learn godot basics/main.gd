extends Node

@onready var health = randi_range(0, 100) #random numbers, randf() is used for floats 
@export var money := randi_range(100, 200) #exports money variable to the inspector
var action = -1
@onready var items: Array[String] = ["Big Bolt", "Thick Rope"] #arrays can be limited to one data type
@onready var cards = ["Fireball", "Big Bolt", 42] #arrays can contain multiple data types
var playDict = {"Eli": 999, "Omar": 1998, "Lewi": 420, "Dylan": 99999, "Vak": 5000}
# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = "Hello World!" #sets text of referenced object
	$Label2.text = str(health) #$[whatever] lets us reference thing in scene
	
	
func _input(event): #listens for input events
	if event.is_action_pressed("jump"): #takes action when pressed
		moneyToHealth(1)
		action = printMH(0)
		print(action)
	
	if event.is_action_pressed("crouch"):
		jump()
		action = printMH(1)
		print(action)
		
	if event.is_action_pressed("inv"):
		checkInv()

func jump(): 
	money += 1
	health -= 1

func moneyToHealth(heal: int): #created functions can take inputs (can limit data types)
	health = health + heal
	money = money - heal
	
func printMH(actionNum) -> int: #created functions can create outputs (can limit data types)
	$Label.text = "money: " + str(money)
	$Label2.text = "health: " + str(health)
	return actionNum #returns data

func checkInv():
	for item in cards:
		print(item)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
