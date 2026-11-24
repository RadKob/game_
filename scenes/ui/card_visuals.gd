class_name CardVisuals
extends Control

@export var card: Card : set = set_card

@onready var panel: Panel = $Panel
@onready var card_type: Label = $Panel/VBoxContainer/PanelType/CardType
@onready var icon: TextureRect = $Panel/VBoxContainer/IconBackground/Icon
@onready var card_name: Label = $Panel/VBoxContainer/PanelName/CardName
@onready var cost: Label = $Panel/CostPanel/Label

func set_card(value: Card) -> void:
	if not is_node_ready():
		await ready
	
	card = value
	card_type.text = Card.Type.keys()[card.type]
	icon.texture = card.icon
	card_name.text = card.card_name
	cost.text = str(card.cost)
