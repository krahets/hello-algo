/*
 * File: selection_sort.rs
 * Created Time: 2023-05-30
 * Author: WSL0809 (wslzzy@outlook.com)
 */

use hello_algo_rust::include::print_util;

/* 선택 정렬 */
fn selection_sort(nums: &mut [i32]) {
    if nums.is_empty() {
        return;
    }
    let n = nums.len();
    // 바깥쪽 반복문: 정렬되지 않은 구간은 [i, n-1]이다
    for i in 0..n - 1 {
        // 안쪽 반복문: 정렬되지 않은 구간의 최솟값을 찾는다
        let mut k = i;
        for j in i + 1..n {
            if nums[j] < nums[k] {
                k = j; // 최솟값의 인덱스를 기록한다
            }
        }
        // 이 최솟값과 정렬되지 않은 구간의 첫 원소를 교환한다
        nums.swap(i, k);
    }
}

/* 실행 코드 */
pub fn main() {
    let mut nums = [4, 1, 3, 1, 5, 2];
    selection_sort(&mut nums);
    print!("\n선택 정렬 후 nums = ");
    print_util::print_array(&nums);
}
