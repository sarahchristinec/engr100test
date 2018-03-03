speaker_forever		cp	speaker_iterator	num_0
speaker_test_start	be	done			speaker_iterator	speaker_length
			cpfa	speaker_sample		speaker_memstart	speaker_iterator
			call	speaker_start		speaker_return_reg
			add	speaker_iterator	speaker_iterator	num_1	//iterate
			be	speaker_test_start	0	0
done			be	speaker_forever	0	0
			halt

speaker_length		19
speaker_iterator	0

speaker_memstart	0
			363717072
			684428797
			924214714
			1054722904
			1060522280
			940927133
			710078208
			395270728
			33727045
			-331804471
			-658103937
			-906590206
			-1047882644
			-1065275049
			-956710970
			-735026858
			-426434300
			-67420806


// receives speaker_sample in speaker_sample
#include speaker_driver.e
#include numbers.e
