/*
 * File: binary_search.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

/* 이진 탐색(양 끝을 포함하는 닫힌 구간) */
fn binary_search(nums: &[i32], target: i32) -> i32 {
    // 닫힌 구간 [0, n-1]을 초기화한다. i와 j는 각각 배열의 첫 원소와 마지막 원소를 가리킨다
    let mut i = 0;
    let mut j = nums.len() as i32 - 1;
    // 반복하다 탐색 구간이 비면 종료한다(i > j이면 빈 구간이다)
    while i <= j {
        let m = i + (j - i) / 2; // 중간 인덱스 m을 계산한다
        if nums[m as usize] < target {
            // 이 경우 target은 구간 [m+1, j]에 있다
            i = m + 1;
        } else if nums[m as usize] > target {
            // 이 경우 target은 구간 [i, m-1]에 있다
            j = m - 1;
        } else {
            // 목표 원소를 찾았으므로 해당 인덱스를 반환한다
            return m;
        }
    }
    // 목표 원소를 찾지 못했으므로 -1을 반환한다
    return -1;
}

/* 이진 탐색(왼쪽 끝은 포함하고 오른쪽 끝은 제외하는 구간) */
fn binary_search_lcro(nums: &[i32], target: i32) -> i32 {
    // 왼쪽 끝만 포함하는 구간 [0, n)을 초기화한다. i는 배열의 첫 원소를, j는 마지막 원소 바로 다음 위치를 가리킨다
    let mut i = 0;
    let mut j = nums.len() as i32;
    // 반복하다 탐색 구간이 비면 종료한다(i = j이면 빈 구간이다)
    while i < j {
        let m = i + (j - i) / 2; // 중간 인덱스 m을 계산한다
        if nums[m as usize] < target {
            // 이 경우 target은 구간 [m+1, j)에 있다
            i = m + 1;
        } else if nums[m as usize] > target {
            // 이 경우 target은 구간 [i, m)에 있다
            j = m;
        } else {
            // 목표 원소를 찾았으므로 해당 인덱스를 반환한다
            return m;
        }
    }
    // 목표 원소를 찾지 못했으므로 -1을 반환한다
    return -1;
}

/* 실행 코드 */
pub fn main() {
    let target = 6;
    let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

    // 이진 탐색(양 끝을 포함하는 닫힌 구간)
    let mut index = binary_search(&nums, target);
    println!("목표 원소 6의 인덱스 = {index}");

    // 이진 탐색(왼쪽 끝은 포함하고 오른쪽 끝은 제외하는 구간)
    index = binary_search_lcro(&nums, target);
    println!("목표 원소 6의 인덱스 = {index}");
}
