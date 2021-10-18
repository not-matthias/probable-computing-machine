#![no_std]
#![feature(lang_items)]

use core::panic::PanicInfo;

extern "C" {
    fn init_ffi();
}

#[lang = "eh_personality"]
#[no_mangle]
pub extern "C" fn eh_personality() {}

#[panic_handler]
fn panic_handler(_info: &PanicInfo) -> ! {
    loop {}
}

#[no_mangle]
pub extern "C" fn init_module() -> i32 {
    let _ = unsafe { init_ffi() };
    1
}

#[no_mangle]
pub extern "C" fn cleanup_module() {}
