CC?=gcc

a.out: main.c test.lds
	$(CC) main.c -Wl,-Ttest.lds $(CFLAGS) $(LDFLAGS) -nostdlib -ffreestanding -fno-pie -static -g -o $@
clean:
	rm -f a.out

