extends Card

func apply_effects(targets: Array[Node]) -> void:
	var mana_effect := ManaEffect.new()
	mana_effect.amount = value
	mana_effect.sound = sound
	mana_effect.execute(targets)
