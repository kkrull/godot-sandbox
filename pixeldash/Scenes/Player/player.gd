extends CharacterBody2D

const BASE_MOVE_SPEED := 250
const GRAVITY := 35
const JUMP_FORCE := 14 * GRAVITY

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("action") and is_on_floor():
		velocity.y -= JUMP_FORCE
		print("velocity=%s" % velocity)
		
		$JumpSound.play()

func _physics_process(delta: float) -> void:
	var input_vector := Input.get_axis("left", "right")
	velocity.x = input_vector * BASE_MOVE_SPEED
	velocity.y += GRAVITY
	move_and_slide()
	
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	
	if velocity.y < 0:
		$AnimatedSprite2D.play("jump")
	elif velocity.y > 0:
		$AnimatedSprite2D.play("fall")
	elif velocity.x != 0:
		$AnimatedSprite2D.play("run")
	else:
		$AnimatedSprite2D.play("idle")
