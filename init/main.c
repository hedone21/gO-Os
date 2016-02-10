#include <stddef.h>
#include <stdint.h>
#include <string.h>
 
#include <gos/debug.h>
#include <gos/tty.h>
 
void kernel_early(void)
{
	terminal_initialize();
}
 
void main(void)
{
	kernel_early();
	printk ("Hello, g/OS!");
}
