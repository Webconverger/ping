ALL_DIRS        = $(filter-out %.txt,$(wildcard 20*))
ALL_OBJS        = $(patsubst %,%.txt,$(ALL_DIRS))

all:    $(ALL_OBJS) total.json

%.txt: %/
	@echo Processing $^
	@find $^ -type f -exec tail -n1 {} \; | awk '{print $$NF}' | sort | uniq -c > $@
	@sed -i 's,^ *,,' $@

header.txt: $(ALL_OBJS)
	./header.sh

total.json: header.txt $(ALL_OBJS)
	./total.sh > total.json

clean:
	rm -f *.txt
