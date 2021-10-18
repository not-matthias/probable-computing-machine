#include <linux/fs.h>
#include <linux/cdev.h>
#include <linux/kern_levels.h>
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/mutex.h>
#include <linux/uaccess.h>

void init_ffi(void) {
    printk(KERN_INFO "FFI: init_ffi\n");
}

MODULE_LICENSE("GPL v2");