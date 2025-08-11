extends CharacterState

func _enter() -> void:
  state_machine.player.animation_player.play("attack")

func _update(_delta: float) -> void:
  var input = Input.get_vector("left", "right", "up", "down")

  var is_animation_playing = state_machine.player.animated_sprite.is_playing() or state_machine.player.animation_player.is_playing()

  if input.length() == 0 and not is_animation_playing:
    dispatch("to_idle")

  if input.length() > 0 and not is_animation_playing:
    dispatch("to_run")
  
  state_machine.player.velocity = Vector2.ZERO
  state_machine.player.move_and_slide()