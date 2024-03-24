extends Node

# One-time steps.
# Pick a voice. Here, we arbitrarily pick the first English voice.
var voices_en = DisplayServer.tts_get_voices_for_language("en")
var voices_fr = DisplayServer.tts_get_voices_for_language("fr")
var voice_id_en = voices_en[0]
var voice_id_fr = voices_fr[0]

func speak(message : String):
	DisplayServer.tts_speak(message, voices_en,100,0)
	DisplayServer.tts_speak(message, voices_fr,100,0)

