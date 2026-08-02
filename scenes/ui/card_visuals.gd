class_name CardVisuals
extends Control

@export var card: Card : set = set_card

@onready var panel: Panel = $Panel
@onready var cost_orbs: Array[TextureRect] = [
	$Panel/CardBackground/CostContainer/OrbContainer/orb1,
	$Panel/CardBackground/CostContainer/OrbContainer/orb2,
	$Panel/CardBackground/CostContainer/OrbContainer/orb3
]
@export var active_orb: Texture2D
@export var inactive_orb: Texture2D
@onready var icon: TextureRect = $Panel/CardBackground/Icon
@onready var card_value: Label = $Panel/CardBackground/Value

@onready var rarity: TextureRect = $Panel/CardBackground/CardFrame
@onready var type: TextureRect = $Panel/CardBackground/CardType

const ATTACK_BG := preload("res://art/card_ui/card_symbol_type_attack.png")
const SKILL_BG := preload("res://art/card_ui/card_symbol_type_skill.png")
const POWER_BG := preload("res://art/card_ui/card_symbol_type_power.png")

const COMMON_FRAME := preload("res://art/card_ui/card_rarity_frame_common.png")
const RARE_FRAME := preload("res://art/card_ui/card_rarity_frame_rare.png")
const EPIC_FRAME := preload("res://art/card_ui/card_rarity_frame_epic.png")

func set_card(value: Card) -> void:
	if not is_node_ready():
		await ready
	
	card = value
	update_cost_orbs(card.cost)
	icon.texture = card.icon
	card_value.text = str(card.value)
	
	match card.type:
		Card.Type.ATTACK:
			type.texture = ATTACK_BG
		Card.Type.SKILL:
			type.texture = SKILL_BG
		Card.Type.POWER:
			type.texture = POWER_BG
	
	match card.rarity:
		Card.Rarity.COMMON:
			rarity.texture = COMMON_FRAME
		Card.Rarity.RARE:
			rarity.texture = RARE_FRAME
		Card.Rarity.EPIC:
			rarity.texture = EPIC_FRAME


func update_cost_orbs(current_cost: int) -> void:
	current_cost = clamp(current_cost, 0, cost_orbs.size())
	
	for i in range(cost_orbs.size()):
		if i < current_cost:
			cost_orbs[i].texture = active_orb
		else:
			cost_orbs[i].texture = inactive_orb
