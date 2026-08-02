class_name CardMenuUI
extends CenterContainer

signal tooltip_requested(card: Card)

const BASE_STYLEBOX := preload("res://scenes/card_ui/card_base_stylebox.tres")
#const HOVER_STYLEBOX := preload("res://scenes/card_ui/card_hover_stylebox. tres")

@export var card: Card: set = set_card
@onready var card_visuals: CardVisuals = $CardVisuals

#@onready var panel: Panel = $Panel
#@onready var cost_orbs: Array[TextureRect] = [
#	$CardVisuals/Panel/CardBackground/CostContainer/OrbContainer/orb1,
#	$CardVisuals/Panel/CardBackground/CostContainer/OrbContainer/orb2,
#	$CardVisuals/Panel/CardBackground/CostContainer/OrbContainer/orb3
#]
#@export var active_orb: Texture2D
#@export var inactive_orb: Texture2D
#@onready var icon: TextureRect = $CardVisuals/Panel/CardBackground/Icon
#@onready var card_value: Label = $CardVisuals/Panel/CardBackground/Value


func _on_visuals_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_mouse"):
		tooltip_requested.emit(card)

func _on_visuals_mouse_entered() -> void:
	#card_visuals.panel.set("theme_override_styles/panel", HOVER_STYLEBOX)
	pass

func _on_visuals_mouse_exited() -> void:
	card_visuals.panel.set("theme_override_styles/panel", BASE_STYLEBOX)

func set_card(value: Card) -> void:
	if not is_node_ready():
		await ready
	
	card = value
	card_visuals.card = card
	#update_cost_orbs(card.cost)
	#icon.texture = card.icon
	#card_value.text = str(card.value)

#func update_cost_orbs(current_cost: int) -> void:
#	current_cost = clamp(current_cost, 0, cost_orbs.size())
#	
#	for i in range(cost_orbs.size()):
#		if i < current_cost:
#			cost_orbs[i].texture = active_orb
#		else:
#			cost_orbs[i].texture = inactive_orb
