extends Node

var sheep_count_label: Label
var sheep_count: int = 0

func _ready() -> void:
    await get_tree().process_frame
    var scene := get_tree().current_scene
    if scene:
        var node := scene.get_node_or_null("SheepCountLabel")
        if node is Label:
            sheep_count_label = node
            sheep_count_label.text = str(sheep_count)

func add_sheep() -> void:
    sheep_count += 1
    if sheep_count_label:
        sheep_count_label.text = str(sheep_count)
