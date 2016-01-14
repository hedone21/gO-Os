# osstudy
OS for studing purpose

## Compile
Compile is easy. If you have as (GNU Assembler), just run command below.
> $ make

## Run
Result file is generated in result folder. Therefore, go to result folder and 
run following command.
> $ qemu-system-x86_64 disk.img

If it doesn't work, do following command below.
> $ qemu-system-x86_64 -m 64 -hda disk.img
