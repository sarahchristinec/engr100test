//reads value from SD card
//receives address in sd_address
//returns data in sd_data_read
//returns sd_return_reg

//sd_command is bit0 of 0x80000080
//sd_response is bit0 of 0x80000081
//sd_write is bit0 of 0x80000082
//sd_address[29:0] is bits 29-0 of 0x80000083
//sd_data_write is bits 31-0 of 0x80000084
//sd_data_read is bits 31-0 of 0x80000085


sd_start	cp	0x80000083	sd_address
		cp	0x80000082	num_0
		cp	0x80000080	num_1

sd_response1	be	sd_lower_cmd	0x80000081	num_1
		be	sd_response1	0		0

sd_lower_cmd	cp	sd_data_read	0x80000085
		cp	0x80000080	num_0

sd_response0	be	sd_done		0x80000081	num_0
		be	sd_response0	0		0

sd_done		ret	sd_return_reg
		halt

sd_address	0
sd_data_read	0
sd_return_reg	0

