/*
 * File: bubble_sort.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

/* 버블 정렬 */
fn bubble_sort(nums: &mut [i32]) {
    // 바깥쪽 반복문: 정렬되지 않은 구간은 [0, i]이다
    for i in (1..nums.len()).rev() {
        // 안쪽 반복문: 정렬되지 않은 구간 [0, i]의 최댓값을 교환하여 이 구간의 맨 오른쪽으로 옮긴다
        for j in 0..i {
            if nums[j] > nums[j + 1] {
                // nums[j]와 nums[j + 1]을 교환한다
                nums.swap(j, j + 1);
            }
        }
    }
}

/* 버블 정렬(플래그 최적화) */
fn bubble_sort_with_flag(nums: &mut [i32]) {
    // 바깥쪽 반복문: 정렬되지 않은 구간은 [0, i]이다
    for i in (1..nums.len()).rev() {
        let mut flag = false; // 플래그를 초기화한다
        // 안쪽 반복문: 정렬되지 않은 구간 [0, i]의 최댓값을 교환하여 이 구간의 맨 오른쪽으로 옮긴다
        for j in 0..i {
            if nums[j] > nums[j + 1] {
                // nums[j]와 nums[j + 1]을 교환한다
                nums.swap(j, j + 1);
                flag = true; // 원소가 교환되었음을 기록한다
            }
        }
        if !flag {
            break; // 이번 버블 과정에서 원소 교환이 없었으므로 바로 종료한다
        };
    }
}

/* 실행 코드 */
pub fn main() {
    let mut nums = [4, 1, 3, 1, 5, 2];
    bubble_sort(&mut nums);
    print!("버블 정렬을 마친 후 nums = ");
    print_util::print_array(&nums);

    let mut nums1 = [4, 1, 3, 1, 5, 2];
    bubble_sort_with_flag(&mut nums1);
    print!("\n버블 정렬 후 nums1 = ");
    print_util::print_array(&nums1);
}
