ALL_DIRS        = $(filter-out %.txt,$(wildcard 20*))
ALL_OBJS        = $(patsubst %,%.txt,$(ALL_DIRS))

all:    $(ALL_OBJS) total.json

%.txt: %/
	@for i in $^/*; do tail -1 $$i; done | sort | uniq -c > $@
	@sed -i 's,^ *,,' $@

header.txt: $(ALL_OBJS)
	./header.sh

total.json: header.txt $(ALL_OBJS)
	./total.sh > total.json

clean:
	rm -f *.txt
