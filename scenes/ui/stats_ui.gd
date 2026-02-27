class_name StatsUI
extends VBoxContainer

@onready var health: Panel = $TopRow/HBoxContainer/HealthPanel
@onready var health_label: Label = $TopRow/HBoxContainer/HealthPanel/HealthLabel
@onready var block: Panel = $TopRow/HBoxContainer/BlockPanel
@onready var block_label: Label = $TopRow/HBoxContainer/BlockPanel/BlockLabel

func update_stats(stats: Stats) -> void:
	block_label.text = str(stats.block)
	health_label.text = str(stats.health)

	block.visible = stats.block > 0
	health.visible = stats.health > 0
