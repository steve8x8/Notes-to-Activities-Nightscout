#!/usr/bin/make -f


json:	.settings
	./last-query
	./csv2exercise

upload:	.settings
	./upload-data

all:	json upload tar clean

tar:
	mkdir -p SAVE
	tar cf SAVE/all-`date +%Y%m%d-%H%M%S`.tar temp_* last_* upload_* *.csv

clean:
	rm temp_* last_* upload_* *.csv

.PHONY:  all json upload  tar clean
