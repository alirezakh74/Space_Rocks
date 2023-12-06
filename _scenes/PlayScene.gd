extends Node

export var Rock : PackedScene

var screensize


func _ready():
	randomize()
	screensize = get_viewport().get_visible_rect().size
	$Player.screensize = screensize
	for i in range(3):
		spawn_rocks(3)

func _on_Player_shoot(bullet, pos, dir):
	var b = bullet.instance()
	b.position = pos
	b.start(pos, dir)
	add_child(b)


func spawn_rocks(size, pos = null, vel = null):
	if !pos:
		$RockPath/RockSpawn.set_offset(randi())
		pos = $RockPath/RockSpawn.position
	if !vel:
		vel = Vector2(1, 0).rotated(rand_range(0, 2 * PI)) * rand_range(100, 150)
	var r = Rock.instance()
	r.screensize = screensize
	r.start(pos, vel, size)
	$Rocks.add_child(r)
