class_name StateMachine
extends LimboHSM

@export var player: Player
var states: Dictionary = {}

func _ready() -> void:
  _setup_states()

func _setup_states():
  for child in get_children():
    if child is CharacterState:
      states[child.name.to_lower()] = child
      child.state_machine = self

  add_transition(states["idlestate"], states["runstate"], "to_run")
  add_transition(states["runstate"], states["idlestate"], "to_idle")
  add_transition(states["runstate"], states["attackstate"], "to_attack")
  add_transition(states["idlestate"], states["attackstate"], "to_attack")
  add_transition(states["attackstate"], states["idlestate"], "to_idle")
  add_transition(states["attackstate"], states["runstate"], "to_run")

  initialize(player)
  set_active(true)
