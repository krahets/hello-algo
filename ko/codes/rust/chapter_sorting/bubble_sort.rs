/*
 * File: bubble_sort.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

/* 버블 정렬 */
fn bubble_sort(nums: &mut [i32]) {
    // 바깥 루프: 미정렬 구간은 [0, i]
    for i in (1..nums.len()).rev() {
        // 안쪽 루프: 미정렬 구간 [0, i]의 최댓값을 교환을 통해 구간의 오른쪽 끝으로 이동
        for j in 0..i {
            if nums[j] > nums[j + 1] {
                // nums[j]와 nums[j + 1] 교환
                nums.swap(j, j + 1);
            }
        }
    }
}

/* 플래그로 최적화한 버블 정렬 */
fn bubble_sort_with_flag(nums: &mut [i32]) {
    // 바깥 루프: 미정렬 구간은 [0, i]
    for i in (1..nums.len()).rev() {
        let mut flag = false; // 플래그 초기화
        // 안쪽 루프: 미정렬 구간 [0, i]의 최댓값을 교환을 통해 구간의 오른쪽 끝으로 이동
        for j in 0..i {
            if nums[j] > nums[j + 1] {
                // nums[j]와 nums[j + 1] 교환
                nums.swap(j, j + 1);
                flag = true; // 원소가 교환되었음을 기록
            }
        }
        if !flag {
            break; // 이 회전에서 교환이 한 번도 없으면 바로 종료
        };
    }
}

/* 실행 예제 */
pub fn main() {
    let mut nums = [4, 1, 3, 1, 5, 2];
    bubble_sort(&mut nums);
    print!("버블 정렬 후 nums = ");
    print_util::print_array(&nums);

    let mut nums1 = [4, 1, 3, 1, 5, 2];
    bubble_sort_with_flag(&mut nums1);
    print!("\n버블 정렬 후 nums1 = ");
    print_util::print_array(&nums1);
}
