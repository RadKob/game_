class_name PlayerStatsUI
extends HBoxContainer

@onready var health: HBoxContainer = $Health
@onready var block: HBoxContainer = $Block
@onready var health_label: Label = $Health/HealthLabel
@onready var block_label: Label = $Block/BlockLabel

func update_stats(stats: Stats) -> void:
	health_label.text = str(stats.health)
	block_label.text = str(stats.block)
	
	block.visible = stats.block > 0
	health.visible = stats.health > 0
