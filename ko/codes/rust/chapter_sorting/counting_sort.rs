/*
 * File: counting_sort.rs
 * Created Time: 2023-07-09
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* 계수 정렬 */
// 간단한 구현이며, 객체 정렬에는 사용할 수 없다
fn counting_sort_naive(nums: &mut [i32]) {
    // 1. 배열의 최댓값 m을 구한다
    let m = *nums.iter().max().unwrap();
    // 2. 각 숫자의 등장 횟수를 센다
    // counter[num]은 num의 등장 횟수를 나타낸다
    let mut counter = vec![0; m as usize + 1];
    for &num in nums.iter() {
        counter[num as usize] += 1;
    }
    // 3. counter를 순회하며 각 원소를 원래 배열 nums에 채운다
    let mut i = 0;
    for num in 0..m + 1 {
        for _ in 0..counter[num as usize] {
            nums[i] = num;
            i += 1;
        }
    }
}

/* 계수 정렬 */
// 완전한 구현이며, 객체를 정렬할 수 있고 안정 정렬이다
fn counting_sort(nums: &mut [i32]) {
    // 1. 배열의 최댓값 m을 구한다
    let m = *nums.iter().max().unwrap() as usize;
    // 2. 각 숫자의 등장 횟수를 센다
    // counter[num]은 num의 등장 횟수를 나타낸다
    let mut counter = vec![0; m + 1];
    for &num in nums.iter() {
        counter[num as usize] += 1;
    }
    // 3. counter의 접두 합을 구하여 등장 횟수를 마지막 인덱스로 변환한다
    // 즉, counter[num]-1은 res에서 num이 마지막으로 등장하는 인덱스이다
    for i in 0..m {
        counter[i + 1] += counter[i];
    }
    // 4. nums를 역순으로 순회하며 각 원소를 결과 배열 res에 채운다
    // 결과를 기록할 배열 res를 초기화한다
    let n = nums.len();
    let mut res = vec![0; n];
    for i in (0..n).rev() {
        let num = nums[i];
        res[counter[num as usize] - 1] = num; // num을 해당 인덱스에 배치한다
        counter[num as usize] -= 1; // 접두 합을 1 감소시켜 다음에 num을 배치할 인덱스를 구한다
    }
    // 결과 배열 res로 원래 배열 nums를 덮어쓴다
    nums.copy_from_slice(&res)
}

/* 실행 코드 */
fn main() {
    let mut nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
    counting_sort_naive(&mut nums);
    print!("계수 정렬(객체 정렬 불가)을 마친 후 nums = ");
    print_util::print_array(&nums);

    let mut nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
    counting_sort(&mut nums1);
    print!("\n계수 정렬 후 nums1 = ");
    print_util::print_array(&nums1);
}
