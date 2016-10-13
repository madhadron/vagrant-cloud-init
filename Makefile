UNAME_S = $(shell uname -s)

clean:
	vagrant destroy --force
	rm minion.iso || true
	rm master.iso || true

%.iso: %/user-data %/meta-data
	rm $@ || true
ifeq ($(UNAME_S),Darwin)
	hdiutil makehybrid -o $@ -hfs -joliet -iso -default-volume-name cidata $*
endif
ifeq ($(UNAME_S),Linux)
	genisoimage -output $@ -volid cidata -joliet -rock $*/user-data $*/meta-data
endif

up: minion.iso master.iso
	vagrant plugin list | grep landrush > /dev/null; \
		if [ $$? -ne 0 ]; then vagrant plugin install landrush; fi
	vagrant up

