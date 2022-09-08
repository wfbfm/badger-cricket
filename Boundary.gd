extends Node

signal wicket_stumps
signal wicket_midwicket
signal wicket_longon
signal wicket_longoff
signal wicket_extracover
signal wicket_cover
signal wicket_deepmidwicket

signal runs_1_squareleg
signal runs_1_point
signal runs_1_cowcorner
signal runs_1_deepextracover

signal runs_4_fineleg
signal runs_4_3rdman
signal runs_4_midon
signal runs_4_midoff
signal runs_4_cover
signal runs_4_legdrive

signal runs_6_downground
signal runs_6_midwicket
signal runs_6_extracover

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_WallWicketLong_wicket():
	emit_signal("wicket_stumps")


func _on_WicketMidWicket_wicket():
	emit_signal("wicket_midwicket")


func _on_WicketLongOn_wicket():
	emit_signal("wicket_longon")


func _on_WicketLongOff_wicket():
	emit_signal("wicket_longoff")


func _on_WicketExtraCover_wicket():
	emit_signal("wicket_extracover")


func _on_WicketCover_wicket():
	emit_signal("wicket_cover")


func _on_WicketDeepMidWicket_wicket():
	emit_signal("wicket_deepmidwicket")


func _on_1RunSquareLeg_runs_1():
	emit_signal("runs_1_squareleg")


func _on_1RunPoint_runs_1():
	emit_signal("runs_1_point")


func _on_1RunCowCorner_runs_1():
	emit_signal("runs_1_cowcorner")


func _on_1RunDeepExtraCover_runs_1():
	emit_signal("runs_1_deepextracover")


func _on_4RunsFineLeg_runs_4():
	emit_signal("runs_4_fineleg")


func _on_4Runs3rdMan_runs_4():
	emit_signal("runs_4_3rdman")


func _on_4RunsMidOn_runs_4():
	emit_signal("runs_4_midon")


func _on_4RunsMidOff_runs_4():
	emit_signal("runs_4_midoff")


func _on_4RunsCover_runs_4():
	emit_signal("runs_4_cover")


func _on_4RunsLegDrive_runs_4():
	emit_signal("runs_4_legdrive")


func _on_6RunsDownGround_runs_6():
	emit_signal("runs_6_downground")


func _on_6RunsMidWicket_runs_6():
	emit_signal("runs_6_midwicket")


func _on_6RunsExtraCover_runs_6():
	emit_signal("runs_6_extracover")
