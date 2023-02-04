/**
 * File: print_util.rs
 * Created Time: 2023-02-05
 * Author: sjinzh (sjinzh@gmail.com)
*/

/* Print an array */
pub fn print_array<T: std::fmt::Display>(nums: &[T]) {
    print!("[");
    if nums.len() > 0 {
        for (i, num) in nums.iter().enumerate() {
            print!("{}{}", num, if i == nums.len() - 1 {"]"} else {", "} );
        }
    } else {
        print!("]");
    }
}