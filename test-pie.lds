SECTIONS
{
    .text :
    {
        *(.text*)
        *(.gnu.linkonce.t*)
        *(.init)
        *(.fini)
        *(.jcr)
        *(.dtors)
        *(.ctors)
    } : text
    
    .rodata ALIGN(0x1000) :
    {
        PROVIDE_HIDDEN(__init_array_start = .);
        *(.init_array*)
        PROVIDE_HIDDEN(__init_array_end = .);
        PROVIDE_HIDDEN(__fini_array_start = .);
        *(.fini_array*)
        PROVIDE_HIDDEN(__fini_array_end = .);
        *(.rodata*)
        *(.gnu.linkonce.r*)
        *(.eh_frame_hdr)
        *(.eh_frame)
    } : rodata

    .note.gnu.build-id :
    {
        PROVIDE_HIDDEN(__build_id_note_start = .);
        *(.note.gnu.build-id)
        PROVIDE_HIDDEN(__build_id_note_end = .);
    } :rodata :note

    . = ALIGN(0x1000);
    .bss ALIGN(0x1000) :
    {
        *(COMMON*)
        *(.bss*)
        *(.gnu.linkonce.b*)
    } : bss

    .data ALIGN(1) :
    {
        *(.data*)
        *(.gnu.linkonce.d*)
    } : data
}

PHDRS
{
    text PT_LOAD FLAGS(5);
    rodata PT_LOAD FLAGS(4);
    bss PT_LOAD FLAGS(6);
    data PT_LOAD FLAGS(6);
    note PT_NOTE FLAGS(0);
}
