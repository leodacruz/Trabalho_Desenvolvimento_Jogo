extends CharacterBody2D

@export var speed = 100
@onready var sprite = $PercySprite
var ultimaDirecao= "right" #tortona pra direita

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func animate():
	if velocity.x > 0:
		ultimaDirecao = "right"
		sprite.play("right")
	elif velocity.x < 0:
		ultimaDirecao = "left"
		sprite.play("left")
	elif velocity.y > 0:
		ultimaDirecao = "down"
		sprite.play("down")
	elif velocity.y < 0:
		ultimaDirecao = "up"
		sprite.play("up")
	else : 
		animateIdle()

func animateIdle():
	match ultimaDirecao:
		"right" :
			sprite.play("idle_right")
		"left" :
			sprite.play("idle_left")
		"down":
			sprite.play("idle_down")
		"up" :
			sprite.play("idle_up")

func _physics_process(delta):
	print("personagem parou pra essa direcao -> ",ultimaDirecao)
	get_input()
	animate()
	move_and_slide()
