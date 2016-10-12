clean:
	vagrant destroy --force
	rm cloud-init.iso

cloud-init.iso: config/user-data config/meta-data
	rm cloud-init.iso || true
	hdiutil makehybrid -o cloud-init.iso -hfs -joliet -iso -default-volume-name cidata config/
	# If you are on Linux, you need to replace the above with:
	# genisoimage -output cloud-init.iso -volid cidata -joliet -rock config/user-data config/meta-data

up: cloud-init.iso
	vagrant up

