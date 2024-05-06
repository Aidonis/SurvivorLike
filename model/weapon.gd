class_name Weapon
extends Resource

@export var name:String
#@export var scene:PackedScene

@export var bullets:int
@export_range(0, 1, .1) var rate_of_fire:float = 1
