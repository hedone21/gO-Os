# g/OS
OS for studing purpose

## Compile
Compile is easy. If you have as (GNU Assembler), just run command below.
> $ make

## Run
Result file is generated in result folder. Therefore, go to result folder and 
run following command.
> $ qemu-system-i386 kernel.iso

If it doesn't work, do following command below.
> $ qemu-system-i386 -m 64 -cdrom kernel.iso
