extends CharacterState

func _update(_delta: float) -> void:
  var input = Input.get_vector("left", "right", "up", "down")

  if input.length() == 0:
    dispatch("to_idle")
  
  if Input.is_action_just_pressed("attack"):
    dispatch("to_attack")

  var sprite = state_machine.player.animated_sprite

  if input.x < 0:
    sprite.flip_h = true
  elif input.x > 0:
    sprite.flip_h = false

  state_machine.player.velocity = input * state_machine.player.stats.speed
  state_machine.player.move_and_slide()