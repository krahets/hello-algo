/*
 * File: radix_sort.rs
 * Created Time: 2023-07-09
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* 원소 num의 k번째 자릿값 반환. 이때 exp = 10^(k-1)이다 */
fn digit(num: i32, exp: i32) -> usize {
    // k 대신 exp를 전달하면 여기서 비용이 큰 거듭제곱 계산을 반복하지 않아도 된다
    return ((num / exp) % 10) as usize;
}

/* 계수 정렬(nums의 k번째 자릿값을 기준으로 정렬) */
fn counting_sort_digit(nums: &mut [i32], exp: i32) {
    // 십진수의 각 자리는 0~9 범위이므로 길이가 10인 버킷 배열이 필요하다
    let mut counter = [0; 10];
    let n = nums.len();
    // 0~9 각 숫자의 등장 횟수를 센다
    for i in 0..n {
        let d = digit(nums[i], exp); // nums[i]의 k번째 자릿값을 구하여 d로 표시한다
        counter[d] += 1; // 숫자 d의 등장 횟수를 센다
    }
    // 접두 합을 구하여 등장 개수를 배열 인덱스로 변환한다
    for i in 1..10 {
        counter[i] += counter[i - 1];
    }
    // 역순으로 순회하며 버킷에 집계된 결과에 따라 각 원소를 res에 채운다
    let mut res = vec![0; n];
    for i in (0..n).rev() {
        let d = digit(nums[i], exp);
        let j = counter[d] - 1; // 배열에서 d의 인덱스 j를 구한다
        res[j] = nums[i]; // 현재 원소를 인덱스 j에 채운다
        counter[d] -= 1; // d의 개수를 1 줄인다
    }
    // 결과로 원래 배열 nums를 덮어쓴다
    nums.copy_from_slice(&res);
}

/* 기수 정렬 */
fn radix_sort(nums: &mut [i32]) {
    // 배열의 최댓값을 구하여 최대 자릿수를 판단한다
    let m = *nums.into_iter().max().unwrap();
    // 낮은 자리에서 높은 자리 순서로 순회한다
    let mut exp = 1;
    while exp <= m {
        counting_sort_digit(nums, exp);
        exp *= 10;
    }
}

/* 실행 코드 */
fn main() {
    // 기수 정렬
    let mut nums = [
        10546151, 35663510, 42865989, 34862445, 81883077, 88906420, 72429244, 30524779, 82060337,
        63832996,
    ];
    radix_sort(&mut nums);
    print!("기수 정렬을 마친 후 nums = ");
    print_util::print_array(&nums);
}
