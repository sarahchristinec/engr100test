//receives location in camera_x and camera_y
//receives scale in camera_scale
//receives mirror in camera_mirror
//returns to camera_return_reg

//camera_command is bit0 of 0x800000b0
//camera_response is bit0 of 0x800000b1
//camera_x[9:0] is bits 9-0 of 0x800000b2
//camera_x[9:0] is bits 9-0 of 0x800000b3
//camera_scale[1:0] is bits 1-0 of 0x800000b4
//camera_mirror is bit0 of 0x800000b5

camera_start		cp	0x800000b2		camera_x
			cp	0x800000b3		camera_y
			cp	0x800000b4		camera_scale
			cp	0x800000b5		camera_mirror
			cp	0x800000b0		num_1
		
camera_response1	be	camera_lower_cmd	0x800000b1	num_1
			be	camera_response1	0		0

camera_lower_cmd	cp	0x800000b0		num_0

camera_response0	be	camera_done		0x800000b1	num_0
			be	camera_response0	0		0

camera_done		ret	camera_return_reg
			halt


camera_x	0
camera_y	0
camera_scale	0
camera_mirror	0
