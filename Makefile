CC?=gcc

a.out: main.c test.lds
	$(CC) main.c -fuse-ld=bfd -Wl,-Ttest.lds $(CFLAGS) $(LDFLAGS) -nostdlib -ffreestanding -fno-pie -static -g -o $@

a-pie.out: main.c test-pie.lds
	$(CC) main.c -fuse-ld=bfd -Wl,-Ttest-pie.lds $(CFLAGS) $(LDFLAGS) -nostdlib -ffreestanding -static-pie -g -o $@

clean:
	rm -f a*.out

