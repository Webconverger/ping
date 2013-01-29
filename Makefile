ALL_DIRS        = $(filter-out %.txt,$(wildcard 20*))
ALL_OBJS        = $(patsubst %,%.txt,$(ALL_DIRS))

all:    $(ALL_OBJS) total.json

%.txt: %/
	@echo Processing $^
	@find $^ -type f | tr -s './' ' ' | awk '{print $$NF}' | sort -u | wc -l > $@
	@sed -i 's,^ *,,' $@

total.json: $(ALL_OBJS)
	./total.sh > total.json

clean:
	rm -f *.txt
