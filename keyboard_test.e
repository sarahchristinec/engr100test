//prints keyboard input to LCD screen

//call lcd_start and keyboard_start
//return to lcd_return_reg and keyboard_return_reg

//start with lowercase letters
//add backspace
//add shift

keyboard_test_start	call	keyboard_start		keyboard_return_reg
			be	keyboard_new_char	keyboard_event		num_1
			be	keyboard_test_start	0			0
keyboard_new_char	cp	lcd_print_char		keyboard_ascii
			blt	key_test_overflow	num_31			key_test_iterator
			blt	key_test_next_row	num_15			key_test_iterator
			be	key_test_first_row	0			0
key_test_overflow	sub	lcd_print_xloc		key_test_iterator	num_32
			cp	lcd_print_yloc		num_0
			be	key_test_iterate	0			0
key_test_first_row	cp	lcd_print_xloc		key_test_iterator
			cp	lcd_print_yloc		num_0
			be	key_test_iterate	0			0
key_test_next_row	sub	lcd_print_xloc		key_test_iterator	num_16
			cp	lcd_print_yloc		num_1

key_test_iterate	add	key_test_iterator	key_test_iterator	num_1
			call	lcd_start		lcd_return_reg
			be	keyboard_test_start	0			0
			halt

key_test_iterator	0


#include lcd_driver.e
#include keyboard_driver.e
#include numbers.e
