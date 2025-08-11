extends CharacterBody2D

var target: Player
@export var stats: Stats

@onready var health_component: HealthComponent = $HealthComponent

var sheep = preload("res://scenes/sheep.tscn")

func _ready():
    target = get_tree().get_first_node_in_group("player")
    health_component.died.connect(on_died)

func on_died() -> void:
    var sheep_instance = sheep.instantiate()
    sheep_instance.global_position = global_position
    get_tree().root.add_child(sheep_instance)
    queue_free()

func _physics_process(_delta):
    if not target:
        return

    var direction = global_position.direction_to(target.global_position)

    velocity = direction * 100
    move_and_slide()