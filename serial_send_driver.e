//sends ascii values to serial port
//returns to serial_send_return_reg
//receives in serial_send_data

//serial_send_command is bit 0 of 0x800000a0
//serial_send_response is bit 0 of 0x800000a1
//serial_send_data[7:0] is bits 7-0 of 0x800000a2


serial_send_start	cp	0x800000a2	serial_send_data
			cp	0x800000a0	num_1

serial_send_response1	be	serial_send_lower_cmd	0x800000a1	num_1
			be	serial_send_response1	0		0

serial_send_lower_cmd	cp	0x800000a0	num_0

serial_send_response0	be	serial_send_done	0x800000a1	num_0
			be	serial_send_response0	0		0
serial_send_done	ret	serial_send_return_reg
			halt


serial_send_data	0
serial_send_return_reg	0
