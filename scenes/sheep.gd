extends Area2D

func _ready() -> void:
  body_entered.connect(on_body_entered)

func on_body_entered(body: Node2D) -> void:
  if body.is_in_group("player"):
    GameManager.add_sheep()
    queue_free()