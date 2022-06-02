extends Control

const leaderboard_link = "http://localhost:3000/player"

func _ready():
	show_leaderboard()

func send_http_get_request():
	$HTTPRequest.request(leaderboard_link)
	return yield($HTTPRequest, "request_completed")

func show_leaderboard():
	var response = yield(send_http_get_request(), "completed")[3]
	var responseJson = parse_json(response.get_string_from_utf8())
	
	print(responseJson)
