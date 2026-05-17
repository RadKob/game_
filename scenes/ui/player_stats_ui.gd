class_name PlayerStatsUI
extends VBoxContainer

@onready var health_bar: ProgressBar = $HBoxContainer/HealthBar
@onready var health_label: Label = $HBoxContainer/HealthBar/HealthLabel

@onready var block_label: Label = $HBoxContainer/BlockLabel

func _ready() -> void:
	health_label.modulate.a = 0.0

	health_bar.mouse_entered.connect(_on_health_mouse_entered)
	health_bar.mouse_exited.connect(_on_health_mouse_exited)

func update_stats(stats: Stats) -> void:
	health_bar.max_value = stats.max_health
	health_bar.value = stats.health
	health_label.text = str(stats.health) + " / " + str(stats.max_health)
	
	block_label.text = str(stats.block)
	#block_label.visible = stats.block > 0

func _on_health_mouse_entered() -> void:
	var tween := create_tween()
	tween.tween_property(health_label, "modulate:a", 1.0, 0.2)

func _on_health_mouse_exited() -> void:
	var tween := create_tween()
	tween.tween_property(health_label, "modulate:a", 0.0, 0.2)
