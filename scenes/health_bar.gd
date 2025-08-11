extends ProgressBar

@export var health_component: HealthComponent

func _ready() -> void:
  min_value = 0
  max_value = health_component.max_health
  update_value(health_component.current_health)
  health_component.current_health_changed.connect(update_value)

func update_value(new_value: int) -> void:
  value = clamp(new_value, 0, health_component.max_health)
