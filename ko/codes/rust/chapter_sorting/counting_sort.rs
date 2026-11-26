/*
 * File: counting_sort.rs
 * Created Time: 2023-07-09
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* 계수 정렬 */
// 객체를 정렬할 수 없는 간단한 구현
fn counting_sort_naive(nums: &mut [i32]) {
    // 1. 배열의 최댓값 m 구하기
    let m = *nums.iter().max().unwrap();
    // 2. 각 숫자의 출현 횟수 세기
    // counter[num]은 num의 출현 횟수
    let mut counter = vec![0; m as usize + 1];
    for &num in nums.iter() {
        counter[num as usize] += 1;
    }
    // 3. counter를 순회하며 각 원소를 원래 배열 nums에 채우기
    let mut i = 0;
    for num in 0..m + 1 {
        for _ in 0..counter[num as usize] {
            nums[i] = num;
            i += 1;
        }
    }
}

/* 계수 정렬 */
// 객체도 정렬할 수 있는 안정 정렬의 전체 구현
fn counting_sort(nums: &mut [i32]) {
    // 1. 배열의 최댓값 m 구하기
    let m = *nums.iter().max().unwrap() as usize;
    // 2. 각 숫자의 출현 횟수 세기
    // counter[num]은 num의 출현 횟수
    let mut counter = vec![0; m + 1];
    for &num in nums.iter() {
        counter[num as usize] += 1;
    }
    // 3. counter의 누적합을 구해 ‘출현 횟수’를 ‘끝 위치’로 변환
    // 즉, counter[num]-1은 res에서 num이 마지막으로 나타나는 인덱스
    for i in 0..m {
        counter[i + 1] += counter[i];
    }
    // 4. nums를 역순으로 순회하며 각 원소를 결과 배열 res에 채우기
    // 결과를 기록할 배열 res 초기화
    let n = nums.len();
    let mut res = vec![0; n];
    for i in (0..n).rev() {
        let num = nums[i];
        res[counter[num as usize] - 1] = num; // num을 해당 인덱스에 배치
        counter[num as usize] -= 1; // 누적합을 1 줄여 다음 num을 배치할 인덱스 구하기
    }
    // 결과 배열 res로 원래 배열 nums를 덮어쓰기
    nums.copy_from_slice(&res)
}

/* 실행 예제 */
fn main() {
    let mut nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
    counting_sort_naive(&mut nums);
    print!("계수 정렬(객체 정렬 불가) 후 nums = ");
    print_util::print_array(&nums);

    let mut nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
    counting_sort(&mut nums1);
    print!("\n계수 정렬 후 nums1 = ");
    print_util::print_array(&nums1);
}
