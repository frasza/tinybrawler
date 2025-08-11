class_name HealthComponent
extends Node

signal current_health_changed(value: int)
signal died()

@export var unit: CharacterBody2D
@export var hurtbox: HurtboxComponent

var max_health: int
var current_health: int

func _ready() -> void:
  max_health = unit.stats.max_health
  current_health = max_health
  hurtbox.damage_hit.connect(take_damage)

func take_damage(hitbox: HitboxComponent) -> void:
  current_health -= hitbox.damage

  current_health_changed.emit(current_health)

  if current_health <= 0:
    died.emit()
