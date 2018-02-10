// prints a message to the LCD screen
// message starts at lcd_message_start
// message of length stored in lcd_message_length

// loop through message array  message length times
	// set x and y based on message length
	// set char based on memory value
	// call lcd_start function
	// return from lcd_start function

lcd_message_start	be	done		lcd_iterator		lcd_message_length
			cpfa	lcd_print_char	lcd_message_memstart	lcd_iterator
			blt	lcd_set_row1	lcd_iterator	lcd_message_num_16
lcd_set_row2		cp	lcd_print_yloc	lcd_message_num_1
			be	lcd_set_column	0	0
lcd_set_row1		cp	lcd_print_yloc	lcd_message_num_0
lcd_set_column		cp 	lcd_print_xloc	lcd_iterator
			add	lcd_iterator	lcd_iterator	lcd_message_num_1		//iterate
			call	lcd_start	lcd_return_reg
			be	lcd_message_start	0	0
done			halt


lcd_print_char			0
lcd_print_xloc			0
lcd_print_yloc			0
lcd_return_reg			0

lcd_message_num_1		1
lcd_message_num_0		0
lcd_message_num_16		16
lcd_iterator	0
lcd_message_length	30

lcd_message_memstart	76
			105
			116
			116
			108
			101
			77
			111
			117
			115
			101
			83
			99
			117
			114
			114
			121
			72
			105
			116
			104
			101
			114
			84
			104
			105
			116
			104
			101
			114
			


// receives x location in lcd_print_xloc
// receives y location in lcd_print_yloc
// receives character in lcd_print_char
#include lcd_driver.e
