extends CharacterBody2D

const SPEED = 40.0

func _physics_process(delta):
	
	var direction_x = Input.get_axis("ui_left", "ui_right")	
	var direction_y = Input.get_axis("ui_up", "ui_down")
	
	if direction_x:
		#$animatedSprite.play("sidewalk")
		#$animatedSprite.flip_h = direction_x > 0
		velocity.x = direction_x * SPEED
		velocity.y = 0
	elif direction_y:
		#var animation = "downwalk" if direction_y > 0 else "upwalk"
		#$animatedSprite.play(animation)
		velocity.y = direction_y * SPEED
		velocity.x = 0
	else:
		#$animatedSprite.play("idle")
		velocity.x = 0
		velocity.y = 0

	move_and_slide()
