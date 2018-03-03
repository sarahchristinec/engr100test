// receives keyboard events
// registers keyboard_event and keyboard_ascii
// returns to keyboard_return_reg

//ps2_command bit0 of 0x80000020
//ps2_response is bit0 of 0x80000021
//ps2_pressed is bit0 of 0x80000022
//ps2_ascii[7:0] is bits 7-0 of 0x80000023


keyboard_start		cp	0x80000020		num_1

keyboard_response1	be	keyboard_lower_cmd	0x80000021	num_1
			be	keyboard_response1	0		0

keyboard_lower_cmd	cp	keyboard_event		0x80000022
			cp	keyboard_ascii		0x80000023
			cp	0x80000020		num_0

keyboard_response2	be	keyboard_done			0x80000021	num_0
			be	keyboard_response2	0		0

keyboard_done		ret	keyboard_return_reg
			halt


keyboard_event		0
keyboard_ascii		0
keyboard_return_reg	0
