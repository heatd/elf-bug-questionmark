ENTRY(_start)

SECTIONS
{
    . = 0x400000;
    _text_start = .;

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
    
    _ro_start = .;

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

    _ro_end = .;
    . = ALIGN(0x1000);

    _bss_start = .;
    .bss ALIGN(0x1000) :
    {
        *(COMMON*)
        *(.bss*)
        *(.gnu.linkonce.b*)
    } : bss

    _bss_end = .;
    _bss_size = _bss_end - _bss_start;

    _text_end = .;
    _data_start = .;
    .data ALIGN(1) :
    {
        *(.data*)
        *(.gnu.linkonce.d*)
    } : data

    kernel_end = .;
}

PHDRS
{
    text PT_LOAD FLAGS(5);
    rodata PT_LOAD FLAGS(4);
    bss PT_LOAD FLAGS(6);
    data PT_LOAD FLAGS(6);
    note PT_NOTE FLAGS(0);
}
