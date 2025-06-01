extends Node2D

var money: int = 0
var money_per_click: int = 1
var upgrade_cost: int = 10

@onready var money_label = $MoneyLabel
@onready var click_button = $ClickButton
@onready var upgrade_button = $UpgradeButton

func _ready():
	click_button.pressed.connect(_on_click_button_pressed)
	upgrade_button.pressed.connect(_on_upgrade_button_pressed)
	update_ui()

func _on_click_button_pressed():
	money += money_per_click
	update_ui()

func _on_upgrade_button_pressed():
	if money >= upgrade_cost:
		money -= upgrade_cost
		money_per_click += 1
		upgrade_cost = int(upgrade_cost * 1.5)
		update_ui()

func update_ui():
	money_label.text = "Money: $" + str(money)
	upgrade_button.text = "Upgrade Click ($" + str(upgrade_cost) + ")"
