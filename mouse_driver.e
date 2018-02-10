// receives mouse events
// receives mouse_deltax in mouse_deltax
// receives mouse_deltay in mouse_deltay
// receives mouse_button1 in mouse_button1
// receives mouse_button2 in mouse_button2
// receives mouse_button3 in mouse_button3
// returns to mouse_return_reg

//mouse_command is bit0 of 0x80000070
//mouse_response is bit0 of 0x80000071
//mouse_deltax is bits 31-0 of 0x80000072
//mouse_deltay is bits 31-0 of 0x80000073
//mouse_button1 is bit0 of 0x80000074
//mouse_button2 is bit0 of 0x80000075
//mouse_button3 is bit0 of 0x80000076


mouse_start	cp	0x80000070	mouse_num_1

mouse_response1	be	mouse_lower_cmd	0x80000071	mouse_num_1
		be	mouse_response1	0		0

mouse_lower_cmd	cp	mouse_deltax	0x80000072
		cp	mouse_deltay	0x80000073
		cp	mouse_button1	0x80000074
		cp	mouse_button2	0x80000075
		cp	mouse_button3	0x80000076

		cp	0x80000070	mouse_num_0

mouse_response0	be	mouse_done	0x80000071	mouse_num_0
		be	mouse_response0	0		0

mouse_done	ret	mouse_return_reg
		halt


mouse_num_0	0
mouse_num_1	1

