//continuously reads from camera

camera_test_start	cp	camera_mirror	0
			cp	camera_scale	2
			cp	camera_x	0
			cp	camera_y	0
camera_loop		call	camera_start		camera_return_reg
			be	camera_loop	0	0
			halt

#include camera_driver.e
#include numbers.e
