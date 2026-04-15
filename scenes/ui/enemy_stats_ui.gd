class_name EnemyStatsUI
extends VBoxContainer

#@onready var health_panel: Panel = $HBoxContainer/HealthPanel
#@onready var health_label: Label = $HBoxContainer/HealthPanel/HealthLabel
#
#func update_stats(stats: Stats) -> void:
	#health_label.text = str(stats.health)
	#block_label.text = str(stats.block)
	#
	#health_panel.visible = stats.health > 0
	#block_panel.visible = stats.block >= 0

@onready var health_bar: ProgressBar = $HBoxContainer/HealthBar
@onready var health_label: Label = $HBoxContainer/HealthBar/HealthLabel

@onready var block_texture: TextureRect = $HBoxContainer/BlockTexture
@onready var block_label: Label = $HBoxContainer/BlockTexture/BlockLabel


func update_stats(stats: Stats) -> void:
	health_bar.max_value = stats.max_health
	health_bar.value = stats.health
	health_label.text = str(stats.health) + " / " + str(stats.max_health)

	#block_label.value = stats.block
	block_label.text = str(stats.block)

	block_texture.visible = stats.block > 0
