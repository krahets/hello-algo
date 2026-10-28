/*
 * File: binary_search_recur.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

/* 이진 탐색: 문제 f(i, j) */
fn dfs(nums: &[i32], target: i32, i: i32, j: i32) -> i32 {
    // 구간이 비어 있으면 목표 원소가 없다는 뜻이므로 -1을 반환한다
    if i > j {
        return -1;
    }
    let m: i32 = i + (j - i) / 2;
    if nums[m as usize] < target {
        // 부분 문제 f(m+1, j)를 재귀적으로 푼다
        return dfs(nums, target, m + 1, j);
    } else if nums[m as usize] > target {
        // 부분 문제 f(i, m-1)를 재귀적으로 푼다
        return dfs(nums, target, i, m - 1);
    } else {
        // 목표 원소를 찾았으므로 해당 인덱스를 반환한다
        return m;
    }
}

/* 이진 탐색 */
fn binary_search(nums: &[i32], target: i32) -> i32 {
    let n = nums.len() as i32;
    // 문제 f(0, n-1)을 푼다
    dfs(nums, target, 0, n - 1)
}

/* 실행 코드 */
pub fn main() {
    let target = 6;
    let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

    // 이진 탐색(양 끝을 포함하는 닫힌 구간)
    let index = binary_search(&nums, target);
    println!("목표 원소 6의 인덱스 = {index}");
}
