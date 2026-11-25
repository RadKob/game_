class_name PlayerStatsUI
extends HBoxContainer

@onready var health: HealthUI = $Health
@onready var block: HBoxContainer = $Block
@onready var block_label: Label = $Block/BlockLabel

func update_stats(stats: Stats) -> void:
	health.update_stats(stats)
	block_label.text = str(stats.block)
	
	block.visible = stats.block > 0
	health.visible = stats.health > 0
