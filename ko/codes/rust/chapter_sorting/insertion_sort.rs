/*
 * File: insertion_sort.rs
 * Created Time: 2023-02-13
 * Author: xBLACKICEx (xBLACKICEx@outlook.com)
 */

use hello_algo_rust::include::print_util;

/* 삽입 정렬 */
fn insertion_sort(nums: &mut [i32]) {
    // 바깥 루프: 정렬된 구간은 [0, i-1]
    for i in 1..nums.len() {
        let (base, mut j) = (nums[i], (i - 1) as i32);
        // 안쪽 루프: base를 정렬된 구간 [0, i-1]의 올바른 위치에 삽입
        while j >= 0 && nums[j as usize] > base {
            nums[(j + 1) as usize] = nums[j as usize]; // nums[j]를 오른쪽으로 한 칸 이동
            j -= 1;
        }
        nums[(j + 1) as usize] = base; // 올바른 위치에 base 대입
    }
}

/* 실행 예제 */
fn main() {
    let mut nums = [4, 1, 3, 1, 5, 2];
    insertion_sort(&mut nums);
    print!("삽입 정렬 후 nums = ");
    print_util::print_array(&nums);
}
