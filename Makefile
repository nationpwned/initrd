all:
	find . ! -path "./.git*" \
	       ! -path "./README.md" \
	       ! -path "./Makefile" \
	       ! -path "./Initrd" \
	       ! -path "./uInitrd" \
	| cpio -o -Hnewc |gzip -9 > Initrd 
	mkimage -n 'uboot ramdisk rootfs' -A arm64 -O linux -T ramdisk -C none -d Initrd uInitrd

clean:
	rm Initrd -rf
	rm uInitrd -rf
