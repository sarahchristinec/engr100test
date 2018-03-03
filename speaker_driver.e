// gets a sound sample
// receives speaker_sample in speaker_sample
// returns to speaker_return_reg

//speaker_command is bit0 of 0x80000040
//speaker_response is bit0 of 0x80000041
//speaker_sample is bits 31-0 of 0x80000042

speaker_start	cp	0x80000042	speaker_sample
		cp	0x80000040	num_1

speaker_response1	be	speaker_lower_cmd	0x80000041	num_1
			be	speaker_response1	0		0

speaker_lower_cmd	cp	0x80000040	num_0

speaker_response0	be	speaker_done	0x80000041	num_0
			be	speaker_response0	0		0

speaker_done	ret	speaker_return_reg
		halt


speaker_sample		0
speaker_return_reg	0
