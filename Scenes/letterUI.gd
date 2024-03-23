class_name LetterUI extends Label

var letter : String
var n : int

func initialize(_letter : String, _n : int):
	letter = _letter
	set_n(_n)
	
func set_n(_n : int):
	n = _n
	if (n <= 0):
		text = ""
		$Color.text = ""
	else:
		text = letter+str(n)+" "
		$Color.text = letter+"[color=#BB0000]"+str(n)
