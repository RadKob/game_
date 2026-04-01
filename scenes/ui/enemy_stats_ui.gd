class_name EnemyStatsUI
extends VBoxContainer

#@onready var health_panel: Panel = $HBoxContainer/HealthPanel
#@onready var health_label: Label = $HBoxContainer/HealthPanel/HealthLabel
#@onready var block_panel: Panel = $HBoxContainer/BlockPanel
#@onready var block_label: Label = $HBoxContainer/BlockPanel/BlockLabel
#
#func update_stats(stats: Stats) -> void:
	#health_label.text = str(stats.health)
	#block_label.text = str(stats.block)
	#
	#health_panel.visible = stats.health > 0
	#block_panel.visible = stats.block >= 0

@onready var health_bar: ProgressBar = $VBoxContainer/HealthBar
@onready var health_label: Label = $VBoxContainer/HealthBar/HealthLabel

@onready var block_bar: ProgressBar = $VBoxContainer/BlockBar
@onready var block_label: Label = $VBoxContainer/BlockBar/BlockLabel

func update_stats(stats: Stats) -> void:
	# HP
	health_bar.max_value = stats.max_health
	health_bar.value = stats.health
	health_label.text = str(stats.health)

	# Block (zakładamy że block nie ma maxa → ustawiasz np. 100 albo dynamicznie)
	block_bar.max_value = stats.max_block
	block_bar.value = stats.block
	block_label.text = str(stats.block)

	# Widoczność
	#health_bar.visible = stats.health > 0
	block_bar.visible = stats.block > 0
