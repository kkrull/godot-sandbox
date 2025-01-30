extends CharacterBody2D

func _on_animated_sprite_2d_ready() -> void:
	$AnimatedSprite2D.play("idle")
