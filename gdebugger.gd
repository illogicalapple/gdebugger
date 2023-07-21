extends Node

var _registered: Array = []
var testing_variable = "test"
var testing_variable_two = "testing"

# debug:
func _ready():
	register("testing_variable", self)
	register("testing_variable_two", self)
	testing_variable = "ddddd"
	break_point()
	testing_variable_two = "aasck"
	testing_variable = "af;dkjl"
	break_point()
	

func register(variable_name: String, root_reference: Object, silent: bool = false):
	_registered.append({ "name": variable_name, "root": root_reference, "value": root_reference.get(variable_name) })
	if not silent:
		print_rich("[b][color=#4d94ff]" + variable_name + "[/color][/b] has successfully been registered")

func unregister(variable_name: String, root_reference: Object, silent: bool = false):
	var index: int = 0
	for element in _registered:
		if (element.name as String == variable_name as String and element.root as Object == (root_reference as Object)) as bool:
			break
		index += 1
		_registered.remove_at(index)

func break_point():
	for element in _registered:
		if element.value != element.root.get(element.name):
			print_rich("[b][color=#4d94ff]" + element.name + ":[/color][/b] [b][color=#ff4d4d]" + element.value + "[/color][/b] -> [b][color=#5fb033]" + element.root.get(element.name) + "[/color][/b]")
			element.value = element.root.get(element.name)
