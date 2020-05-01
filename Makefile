#!/usr/bin/make -f

last:	.settings
	./last-query

exe:	upload_exercise.json

upload_exercise.json:	last_exercise
	./csv2exercise

new:	last exe

up:	.settings
	./upload-data

tar:
	mkdir -p SAVE
	tar cf SAVE/all-`date +%Y%m%d-%H%M%S`.tar temp_* last_* upload_* *.csv

clean:
	rm temp_* last_* upload_* *.csv

.PHONY:  last exe  new up tar clean
