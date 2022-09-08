extends Node

export(PackedScene) var ball_scene

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var runs = 0
var wickets = 0
var ball_count: float = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	new_game()

func new_game():
	$PlayAgain.hide()
	$Info.text = ""
	runs = 0
	wickets = 0
	ball_count = 0
	update_score(runs, wickets)
	$Badger.start($StartPosition.position)
	$BallTimer.start()
	$AllOut.hide()
	
func game_over():
	$BallTimer.stop()
	$AllOut.text = "Badgers all out for " + str(runs) + "!"
	$AllOut.show()
	$PlayAgain.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func update_score(input_runs, input_wickets):
	$Score.text = "Badgers: " + str(input_runs) + " - " + str(input_wickets)


func _on_BallTimer_timeout():
	# Create a new instance of the Ball scene.
	var ball = ball_scene.instance()
	ball_count += 1

	# Choose a random location on Path2D.
	var ball_spawn_location = get_node("BallPath/BallSpawnLocation")
	ball_spawn_location.offset = randi()

	# Set the ball's position to a random location.
	ball.position = ball_spawn_location.position
	
		# Set the ball's direction towards the wickets
	var top_end_direction = (Vector2(0,400) - ball.position).angle()
	if top_end_direction < 0:
		top_end_direction = 2*PI + top_end_direction

	var bot_end_direction = (Vector2(0,250) - ball.position).angle()
	if bot_end_direction < 0:
		bot_end_direction = 2*PI + bot_end_direction

	# Add some randomness to the direction.
	var direction = rand_range(bot_end_direction, top_end_direction)

	ball.rotation = top_end_direction

	# Choose the velocity for the ball
	var lower_end = (1 + ball_count/25)*300.0
	if lower_end > 1500:
		lower_end = 1500
	var upper_end = (1 + ball_count/25)*800.0
	if upper_end > 1600:
		upper_end = 1600

	var velocity = Vector2(rand_range(lower_end, upper_end), 0.0)
	ball.linear_velocity = velocity.rotated(direction)

	# Spawn the ball by adding it to the Main scene.
	add_child(ball)


func _on_Boundary_wicket_stumps():
	$Info.text = "Badger bowled through the gate!"
	wickets += 1
	update_score(runs, wickets)
	if wickets >= 10:
		game_over()


func _on_Boundary_wicket_cover():
	$Info.text = "Badger caught at cover!"
	wickets += 1
	update_score(runs, wickets)
	if wickets >= 10:
		game_over()


func _on_Boundary_wicket_deepmidwicket():
	$Info.text = "Badger caught in the deep!"
	wickets += 1
	update_score(runs, wickets)
	if wickets >= 10:
		game_over()

func _on_Boundary_wicket_extracover():
	$Info.text = "Badger caught at extra cover!"
	wickets += 1
	update_score(runs, wickets)
	if wickets >= 10:
		game_over()

func _on_Boundary_wicket_longoff():
	$Info.text = "Badger caught at long off!"
	wickets += 1
	update_score(runs, wickets)
	if wickets >= 10:
		game_over()

func _on_Boundary_wicket_longon():
	$Info.text = "Badger caught at long on!"
	wickets += 1
	update_score(runs, wickets)
	if wickets >= 10:
		game_over()

func _on_Boundary_wicket_midwicket():
	$Info.text = "Badger caught at midwicket!"
	wickets += 1
	update_score(runs, wickets)
	if wickets >= 10:
		game_over()

func _on_Boundary_runs_1_cowcorner():
	if wickets < 10:
		$Info.text = "Badger didn't get all of it - single"
		runs += 1
		update_score(runs, wickets)


func _on_Boundary_runs_1_deepextracover():
	if wickets < 10:
		$Info.text = "Badger didn't get all of it - single"
		runs += 1
		update_score(runs, wickets)


func _on_Boundary_runs_1_point():
	if wickets < 10:
		$Info.text = "Badger takes a single through point"
		runs += 1
		update_score(runs, wickets)


func _on_Boundary_runs_1_squareleg():
	if wickets < 10:
		$Info.text = "Badger takes a single through square leg"
		runs += 1
		update_score(runs, wickets)


func _on_Boundary_runs_4_3rdman():
	if wickets < 10:
		$Info.text = "Badger edges past the keeper"
		runs += 4
		update_score(runs, wickets)


func _on_Boundary_runs_4_cover():
	if wickets < 10:
		$Info.text = "Badger marmalises a cover drive!"
		runs += 4
		update_score(runs, wickets)


func _on_Boundary_runs_4_fineleg():
	if wickets < 10:
		$Info.text = "Badger flicks it off the legs for 4"
		runs += 4
		update_score(runs, wickets)


func _on_Boundary_runs_4_legdrive():
	if wickets < 10:
		$Info.text = "Badger showcases their leg-drive!"
		runs += 4
		update_score(runs, wickets)


func _on_Boundary_runs_4_midoff():
	if wickets < 10:
		$Info.text = "Badger gets it past mid-off!"
		runs += 4
		update_score(runs, wickets)


func _on_Boundary_runs_4_midon():
	if wickets < 10:
		$Info.text = "Badger hammers it for 4!"
		runs += 4
		update_score(runs, wickets)


func _on_Boundary_runs_6_downground():
	if wickets < 10:
		$Info.text = "Badger goes down the ground for 6!"
		runs += 6
		update_score(runs, wickets)


func _on_Boundary_runs_6_extracover():
	if wickets < 10:
		$Info.text = "Badger gets this over extra cover!"
		runs += 6
		update_score(runs, wickets)


func _on_Boundary_runs_6_midwicket():
	if wickets < 10:
		$Info.text = "Badger hits this into the stands!"
		runs += 6
		update_score(runs, wickets)


func _on_PlayAgain_pressed():
	new_game()
