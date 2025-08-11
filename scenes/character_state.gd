class_name CharacterState
extends LimboState

@export var animation_name: String

var state_machine: StateMachine

func _enter() -> void:
   state_machine.player.animated_sprite.play(animation_name)
