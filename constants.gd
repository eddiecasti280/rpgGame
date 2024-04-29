extends Node

# CHARACTER ATTRIBUTES
const health: String = "Health"
const attack: String = "Attack"
const magic_attack: String = "Magic Attack"

# random number generator
var RNG = RandomNumberGenerator.new()


var MINIONS_FILE: String = "res://json_files/party_members.json"
var minions

func _init():
	var file = FileAccess.open(MINIONS_FILE, FileAccess.READ)
	minions = JSON.parse_string(file.get_as_text())
	file.close()
