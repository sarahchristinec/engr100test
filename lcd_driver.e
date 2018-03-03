// writes a specific character to a specific location
// receives x location in lcd_print_xloc
// receives y location in lcd_print_yloc
// receives character in lcd_print_char
// returns to lcd_return_reg

//lcd_command is bit0 of 0x80000010
//lcd_response is bit0 of 0x80000011
//lcd_x[3:0] is bits 3-0 of 0x80000012
//lcd_y is bit0 of 0x80000013
//lcd_ascii[7:0] is bits 7-0 of 0x80000014

// set lcd_x, lcd_y, lcd_ascii
// set lcd_command to 1
// wait for lcd_response to be 1
// set lcd_command to be 0
// wait for lcd_response to be 0

lcd_start	cp	0x80000012	lcd_print_xloc
		cp	0x80000013	lcd_print_yloc
		cp	0x80000014	lcd_print_char
lcd_raise_cmd	cp	0x80000010	num_1

lcd_response1	be	lcd_lower_cmd	0x80000011	num_1
		be	lcd_response1	0		0
lcd_lower_cmd	cp	0x80000010	num_0

lcd_response0	be	lcd_done	0x80000011	num_0
		be	lcd_response0	0		0

lcd_done	ret	lcd_return_reg
		halt


lcd_print_char	0
lcd_print_xloc	0
lcd_print_yloc	0
lcd_return_reg	0
