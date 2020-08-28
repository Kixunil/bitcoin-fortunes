NAMES=aantonop-quotes btc-jokes random-btc-history satoshi-quotes other-btc-quotes
DAT_FILES=$(patsubst %, %.dat, $(NAMES))
U8_FILES=$(patsubst %, %.u8, $(NAMES))

all: $(DAT_FILES)

clean:
	rm -f *.dat

%.dat: %.u8
	strfile $< $@

install:
	mkdir -p /usr/share/games/fortunes
	cp $(DAT_FILES) $(U8_FILES) /usr/share/games/fortunes/
	for F in $(NAMES); do ln -fs $$F.u8 /usr/share/games/fortunes/$$F; done

uninstall:
	rm -f $(patsubst %, /usr/share/games/fortunes/%, $(NAMES)) $(patsubst %, /usr/share/games/fortunes/%, $(DAT_FILES)) $(patsubst %, /usr/share/games/fortunes/%, $(U8_FILES))

.PHONY: all clean install uninstall
