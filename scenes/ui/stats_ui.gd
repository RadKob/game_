class_name StatsUI
extends VBoxContainer

@onready var health_panel: Panel = $TopRow/HBoxContainer/HealthPanel
@onready var health_label: Label = $TopRow/HBoxContainer/HealthPanel/HealthLabel
@onready var block_panel: Panel = $TopRow/HBoxContainer/BlockPanel
@onready var block_label: Label = $TopRow/HBoxContainer/BlockPanel/BlockLabel

func update_stats(stats: Stats) -> void:
	health_label.text = str(stats.health)
	block_label.text = str(stats.block)
	
	health_panel.visible = stats.health > 0
	block_panel.visible = stats.block >= 0
