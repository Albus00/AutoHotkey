; Username  =  -XWgFYuDLizR--oqZZ2Lt5zSGA9ekNylhvdUGCZw
; Source    =  https://www.howtogeek.com/319428/how-to-control-your-philips-hue-lights-with-keyboard-shortcuts/
; IP			= 	http://192.168.1.105/

WinHTTP := ComObjCreate("WinHTTP.WinHttpRequest.5.1")

lamp := 8 ; id of "Lampa"
tableLamp := 9 ; id of "Bordslampa"
presets := [0.1, 0.2, 0.5, 0.8, 1]	; Brightness presets

lampCurrentPreset = 0
tableLampCurrentPreset = 0

maxBri = 254 ; Maximum brightness

; "Lampa" presets
philips_2()
{
	presetManager("2", "lamp")
}

modifyLightBrightness(9, 254, ByRef WinHTTP)

; "Bordslampa" presets
philips_5()
{
	presetManager("5", "tableLamp")
}

; Modify light brightness
modifyLightBrightness(light, bri, ByRef WinHTTP)
{
	WinHTTP.Open("PUT", "http://192.168.1.105/api/-XWgFYuDLizR--oqZZ2Lt5zSGA9ekNylhvdUGCZw/lights/" . light . "/state", 0)
	bodytext = {"on" : true}
	WinHTTP.Send(bodytext)
   return
}

presetManager(button, light)
{
	; Get lights current preset
	if (light == "lamp") {
		lightPreset = %lampCurrentPreset%
	}
	else if (light == "tableLamp") {
		lightPreset = %tableLampCurrentPreset%
	}
	else {
		MsgBox, Philips light "%light%" not found
			return
	}

	if (lightPreset == 0) {
		; If light is off: preset is determined by right, left or center press
		switch [%button%]
		{
			case "1", "4":
				modifyLightBrightness(light, maxBri * preset[1], ByRef WinHTTP)

			case "5", "2":
				modifyLightBrightness(light, maxBri * preset[2], ByRef WinHTTP)

			case "6", "3":
				modifyLightBrightness(light, maxBri * preset[3], ByRef WinHTTP)

			default:
				MsgBox, Philips modify button "%button%" not found
				return
		}
	}
	else {
		; Get next preset value and apply it
		for k, v in %preset% {
			if (v == currentPreset) {
				nextPreset := preset[k+1]
				modifyLightBrightness(light, maxBri * nextPreset, ByRef WinHTTP)
				break
			}
		}	
	}
}

; ; toggle all lights
; ^!l::
; 	WinHTTP.Open("PUT", "http://192.168.1.105/api/-XWgFYuDLizR--oqZZ2Lt5zSGA9ekNylhvdUGCZw/groups/0/action", 0)
; 	if lightsOn > 0
; 		bodytext = {"on" : false}
; 	else
; 		bodytext = {"on" : true}
; 	WinHTTP.Send(bodytext)
; 	lightsOn := 1 - lightsOn
; 	return
	
; ; control-alt-o : all lights off
; ^!o::
; 	WinHTTP.Open("PUT", "http://192.168.1.105/api/-XWgFYuDLizR--oqZZ2Lt5zSGA9ekNylhvdUGCZw/groups/0/action", 0)
; 	bodytext = {"on" : false}
; 	WinHTTP.Send(bodytext)
; 	lightsOn := 0
; 	return

; ^!1::
; 	curgroup := livingroom
; 	return
; ^!2::
; 	curgroup := bedroom
; 	return
	

; setlightct(light, newct, ByRef WinHTTP)
; {
; 	WinHTTP.Open("PUT", "http://192.168.1.105/api/-XWgFYuDLizR--oqZZ2Lt5zSGA9ekNylhvdUGCZw/lights/" . light . "/state", 0)
; 	bodytext = {"ct" : %newct%}
; 	WinHTTP.Send(bodytext)
; }
; modifylightct(light, amount, ByRef WinHTTP)
; {
; 	WinHTTP.Open("PUT", "http://192.168.1.105/api/-XWgFYuDLizR--oqZZ2Lt5zSGA9ekNylhvdUGCZw/lights/" . light . "/state", 0)
; 	bodytext = {"ct_inc" : %amount%, "transitiontime" : 2}
; 	WinHTTP.Send(bodytext)
; }
; modifylightbrightness(light, amount, ByRef WinHTTP)
; {
; 	WinHTTP.Open("PUT", "http://192.168.1.105/api/-XWgFYuDLizR--oqZZ2Lt5zSGA9ekNylhvdUGCZw/lights/" . light . "/state", 0)
; 	bodytext = {"bri_inc" : %amount%, "transitiontime" : 2}
; 	WinHTTP.Send(bodytext)
; }

; ^!Up::
; 	for _, light in curgroup
; 		modifylightct(light, 43, WinHTTP)
; 	return

; ^!Down::
; 	for _, light in curgroup
; 		modifylightct(light, -43, WinHTTP)
; 	return
	
; ^!Left::
; 	for _, light in curgroup
; 		modifylightbrightness(light, -32, WinHTTP)
; 	return

; ^!Right::
; 	for _, light in curgroup
; 		modifylightbrightness(light, 32, WinHTTP)
; 	return