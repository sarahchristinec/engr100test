// sends array of color values to monitor

vga_write_test_start		be	vga_write_test_done	vga_write_test_iter		vga_write_length
				cpfa	vga_write_x1		vga_write_x1_memstart		vga_write_test_iter
				cpfa	vga_write_x2		vga_write_x2_memstart		vga_write_test_iter
				cpfa	vga_write_y1		vga_write_y1_memstart		vga_write_test_iter
				cpfa	vga_write_y2		vga_write_y2_memstart		vga_write_test_iter
				cpfa	vga_write_color		vga_write_color_memstart	vga_write_test_iter
				call	vga_write_start		vga_write_return_reg
				add	vga_write_test_iter	vga_write_test_iter		num_1
				be	vga_write_test_start	0				0
vga_write_test_done		halt


vga_write_test_iter		0
vga_write_length		5

vga_write_x1_memstart		0
				240
				280
				340
				305

vga_write_x2_memstart		639
				400
				300
				360
				335

vga_write_y1_memstart		0
				180
				210
				210
				250

vga_write_y2_memstart		479
				300
				230
				230
				300

vga_write_color_memstart	0x0
				0xafcf
				0xffffff
				0xffffff
				0x808040

// receives vga color in vga_write_color
// receives vga_x1 coordinate in vga_write_x1
// receives vga_x2 coordinate in vga_write_x2
// receives vga_y1 coordinate in vga_write_y1
// receives vga_y2 coordinate in vga_write_y2
#include vga_driver.e
#include numbers.e
