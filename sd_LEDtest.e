sd_test_start	cp	sd_address	sd_test_address
		call	sd_start	sd_return_reg
		cp	0x80000001	sd_data_read
		add	sd_test_address	sd_test_address	num_1
		bne	sd_test_start	sd_data_read	num_0
		halt

#include sd_driver.e
#include numbers.e
