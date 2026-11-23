/*
 * File: two_sum.rs
 * Created Time: 2023-01-14
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;
use std::collections::HashMap;

/* 방법 1: 완전 열거 */
pub fn two_sum_brute_force(nums: &Vec<i32>, target: i32) -> Option<Vec<i32>> {
    let size = nums.len();
    // 이중 반복문이며 시간 복잡도는 O(n^2)이다
    for i in 0..size - 1 {
        for j in i + 1..size {
            if nums[i] + nums[j] == target {
                return Some(vec![i as i32, j as i32]);
            }
        }
    }
    None
}

/* 방법 2: 보조 해시 테이블 */
pub fn two_sum_hash_table(nums: &Vec<i32>, target: i32) -> Option<Vec<i32>> {
    // 보조 해시 테이블의 공간 복잡도는 O(n)이다
    let mut dic = HashMap::new();
    // 단일 반복문이며 시간 복잡도는 O(n)이다
    for (i, num) in nums.iter().enumerate() {
        match dic.get(&(target - num)) {
            Some(v) => return Some(vec![*v as i32, i as i32]),
            None => dic.insert(num, i as i32),
        };
    }
    None
}

fn main() {
    // ======= 테스트 사례 =======
    let nums = vec![2, 7, 11, 15];
    let target = 13;

    // ====== 실행 코드 ======
    // 방법 1
    let res = two_sum_brute_force(&nums, target).unwrap();
    print!("방법 1 res = ");
    print_util::print_array(&res);
    // 방법 2
    let res = two_sum_hash_table(&nums, target).unwrap();
    print!("\n방법 2 res = ");
    print_util::print_array(&res);
}
