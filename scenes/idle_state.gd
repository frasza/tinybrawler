extends CharacterState

func _update(_delta: float) -> void:
  var input = Input.get_vector("left", "right", "up", "down")

  if input.length() > 0:
    dispatch("to_run")

  if Input.is_action_just_pressed("attack"):
    dispatch("to_attack")
  
  state_machine.player.move_and_slide()