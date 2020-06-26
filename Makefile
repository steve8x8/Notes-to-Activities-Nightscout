#!/usr/bin/make -f

all:	json upload tar clean

json:	.settings
	./last-query
	./csv2exercise

upload:	.settings
	./upload-data

tar:
	mkdir -p SAVE
	LC_ALL=C tar cf SAVE/all-`date +%Y%m%d-%H%M%S`.tar temp_* last_* upload_* *.csv

clean:
	rm -rf temp_* last_* upload_* *.csv

.PHONY:  all json upload  tar clean
