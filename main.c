// This experiment creates a 2049-sized bss segment
// and then sticks .data (with the data variable) right after it
// You'll notice it completely misloads if .bss and .data share the
// same page, since it will just load .data over .bss (with mmap MAP_FIXED)
// (please see test.lds for the associated linker script)

char bss_filler[2049];
unsigned int data = 0xdeaddead;

void _start()
{
    if (data != 0xdeaddead)
        __asm__ __volatile__("ud2");
    for (int i = 0; i < 2049; i++)
        if (bss_filler[i] != 0)
            __asm__ __volatile__("ud2");
    __asm__ __volatile__("mov $231, %eax; syscall");
}
