// displays mouse position on hexdigits
// lights up green leds corresponding to last button pressed

mouse_test_start	call	mouse_start mouse_return_reg
mouse_check_first	be	mouse_light_4		mouse_button1		num_1
			be	mouse_check_next	0	0
mouse_light_4		cp	0x80000002		num_4
mouse_check_next	be	mouse_light_1		mouse_button2		num_1
			be	mouse_check_last	0	0
mouse_light_1		cp	0x80000002		num_2
mouse_check_last	be	mouse_light_2		mouse_button3		num_1
			be	mouse_check_pos		0	0
mouse_light_2		cp	0x80000002		num_1

mouse_check_pos		add	mouse_test_check_range	mouse_posx		mouse_deltax
			blt	mouse_test_minoutx	mouse_test_check_range	num_0
			blt	mouse_test_maxoutx	mouse_test_xmax		mouse_test_check_range
			cp	mouse_posx		mouse_test_check_range
			be	mouse_checky		0	0
mouse_test_minoutx	cp	mouse_posx		num_0
			be	mouse_checky		0	0
mouse_test_maxoutx	cp	mouse_posx		mouse_test_xmax

mouse_checky		add	mouse_test_check_range	mouse_posy		mouse_deltay
			blt	mouse_test_minouty	mouse_test_check_range	num_0
			blt	mouse_test_maxouty	mouse_test_ymax		mouse_test_check_range
			cp	mouse_posy		mouse_test_check_range
			be	mouse_test_print	0	0
mouse_test_minouty	cp	mouse_posy		num_0
			be	mouse_test_print	0	0
mouse_test_maxouty	cp	mouse_posy		mouse_test_ymax

mouse_test_print	cp	0x80000003		mouse_posx
			cp	0x80000004		mouse_posy
			

mouse_test_done		be	mouse_test_start	0	0	
			
			halt


mouse_all_off		0
mouse_test_xmax		639
mouse_test_ymax		479
mouse_test_check_range	0

mouse_posx		0
mouse_posy		0

// receives mouse_deltax in mouse_deltax
// receives mouse_deltay in mouse_deltay
// receives mouse_button1 in mouse_button1
// receives mouse_button2 in mouse_button2
// receives mouse_button3 in mouse_button3
#include mouse_driver.e
#include numbers.e
