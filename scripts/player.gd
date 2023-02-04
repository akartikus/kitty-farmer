extends CharacterBody2D

const SPEED = 40.0

var is_animate = true 
var is_acting = false
var last_direction = Vector2.ZERO
	
func _physics_process(delta):
	process_movement()

func process_movement():
	var direction_x = Input.get_axis("ui_left", "ui_right")	
	var direction_y = Input.get_axis("ui_up", "ui_down")
	
	if direction_x:
		is_animate = true
		$AnimationPlayer.play("sidewalk")
		$Sprite2D.flip_h = direction_x < 0
		velocity.x = direction_x * SPEED
		velocity.y = 0
		last_direction = Vector2.RIGHT if direction_x > 0 else Vector2.LEFT
	elif direction_y:
		is_animate = true
		$AnimationPlayer.play("downwalk" if direction_y > 0 else "upwalk")
		last_direction = Vector2.DOWN if direction_y > 0 else Vector2.UP
		velocity.y = direction_y * SPEED
		velocity.x = 0
	else:	
		if is_animate:	
			is_animate = false
			$AnimationPlayer.pause()
			if not is_acting:
				$IdleTimer.start(1.5)
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide()
	
func _on_idle_timer_timeout():
	# Play different idle according to direction
	match last_direction:
		Vector2.DOWN:
			$AnimationPlayer.play("idle")
		Vector2.UP:
			$AnimationPlayer.play("upidle")
		Vector2.LEFT, Vector2.RIGHT:
			$AnimationPlayer.play("sideidle")
			
