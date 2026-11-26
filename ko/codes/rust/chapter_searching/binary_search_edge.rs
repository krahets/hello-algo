/*
 * File: binary_search_edge.rs
 * Created Time: 2023-08-30
 * Author: night-cruise (2586447362@qq.com)
 */

mod binary_search_insertion;

use binary_search_insertion::binary_search_insertion;

/* 이진 탐색으로 가장 왼쪽의 target 찾기 */
fn binary_search_left_edge(nums: &[i32], target: i32) -> i32 {
    // target의 삽입 위치를 찾는 것과 같다.
    let i = binary_search_insertion(nums, target);
    // target을 찾지 못했으므로 -1을 반환한다.
    if i == nums.len() as i32 || nums[i as usize] != target {
        return -1;
    }
    // target을 찾았으므로 인덱스 i를 반환한다.
    i
}

/* 이진 탐색으로 가장 오른쪽의 target 찾기 */
fn binary_search_right_edge(nums: &[i32], target: i32) -> i32 {
    // 가장 왼쪽의 target + 1을 찾는 문제로 바꾼다.
    let i = binary_search_insertion(nums, target + 1);
    // j는 가장 오른쪽의 target을, i는 target보다 큰 첫 원소를 가리킨다.
    let j = i - 1;
    // target을 찾지 못했으므로 -1을 반환한다.
    if j == -1 || nums[j as usize] != target {
        return -1;
    }
    // target을 찾았으므로 인덱스 j를 반환한다.
    j
}

/* 실행 예제 */
fn main() {
    // 중복 원소가 있는 배열
    let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
    println!("\n배열 nums = {:?}", nums);

    // 이진 탐색으로 왼쪽 경계와 오른쪽 경계 찾기
    for target in [6, 7] {
        let index = binary_search_left_edge(&nums, target);
        println!("찾을 값 = {} | 첫 인덱스 = {}", target, index);
        let index = binary_search_right_edge(&nums, target);
        println!("찾을 값 = {} | 마지막 인덱스 = {}", target, index);
    }
}
