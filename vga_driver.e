// receives vga events
// receives vga color in vga_write_color
// receives vga_x1 coordinate in vga_write_x1
// receives vga_x2 coordinate in vga_write_x2
// receives vga_y1 coordinate in vga_write_y1
// receives vga_y2 coordinate in vga_write_y2
// returns to vga_write_return_reg

//vga_write_command is bit0 of 0x80000060
//vga_write_response is bit0 of 0x80000061
//vga_write_write is bit0 of 0x80000062
//vga_write_x1[9:0] is bits 9-0 of 0x80000063
//vga_write_y1[9:0] is bits 9-0 of 0x80000064
//vga_write_x2[9:0] is bits 9-0 of 0x80000065
//vga_write_y2[9:0] is bits 9-0 of 0x80000066
//vga_write_color_write[23:0] is bits 23-0 of 0x80000067
//vga_write_color_read[23:0] is bits 23-0 of 0x80000068

vga_write_start		cp	0x80000062		num_1
			cp	0x80000063		vga_write_x1
			cp	0x80000065		vga_write_x2
			cp	0x80000064		vga_write_y1
			cp	0x80000066		vga_write_y2
			cp	0x80000067		vga_write_color
vga_write_raise_cmd	cp	0x80000060		num_1

vga_write_response1	be	vga_write_lower_cmd	0x80000061	num_1
			be	vga_write_response1	0		0
vga_write_lower_cmd	cp	0x80000060		num_0

vga_write_response0	be	vga_write_done		0x80000061	num_0
			be	vga_write_response0	0		0

vga_write_done		ret	vga_write_return_reg
			halt


vga_write_color		0
vga_write_x1		0
vga_write_x2		0
vga_write_y1		0
vga_write_y2		0
vga_write_return_reg	0
