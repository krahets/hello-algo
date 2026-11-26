/*
 * File: radix_sort.rs
 * Created Time: 2023-07-09
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* 원소 num의 k번째 자릿값 구하기. 여기서 exp = 10^(k-1) */
fn digit(num: i32, exp: i32) -> usize {
    // k 대신 exp를 전달하여 비용이 큰 거듭제곱 연산의 반복 방지
    return ((num / exp) % 10) as usize;
}

/* 계수 정렬(nums의 k번째 자릿값 기준) */
fn counting_sort_digit(nums: &mut [i32], exp: i32) {
    // 십진수 한 자리의 값은 0~9이므로 길이 10인 버킷 배열이 필요함
    let mut counter = [0; 10];
    let n = nums.len();
    // 0~9의 각 숫자가 나타난 횟수 세기
    for i in 0..n {
        let d = digit(nums[i], exp); // nums[i]의 k번째 자릿값을 구해 d에 저장
        counter[d] += 1; // 숫자 d의 출현 횟수 세기
    }
    // 누적합을 구해 ‘출현 횟수’를 ‘배열 인덱스’로 변환
    for i in 1..10 {
        counter[i] += counter[i - 1];
    }
    // 역순으로 순회하며 버킷별 계수 결과에 따라 각 원소를 res에 채우기
    let mut res = vec![0; n];
    for i in (0..n).rev() {
        let d = digit(nums[i], exp);
        let j = counter[d] - 1; // 배열에서 d가 들어갈 인덱스 j 구하기
        res[j] = nums[i]; // 현재 원소를 인덱스 j에 배치
        counter[d] -= 1; // d의 개수를 1 줄이기
    }
    // 결과로 원래 배열 nums를 덮어쓰기
    nums.copy_from_slice(&res);
}

/* 기수 정렬 */
fn radix_sort(nums: &mut [i32]) {
    // 최대 자릿수를 알아내기 위해 배열의 최댓값 구하기
    let m = *nums.into_iter().max().unwrap();
    // 낮은 자리부터 높은 자리까지 차례로 순회
    let mut exp = 1;
    while exp <= m {
        counting_sort_digit(nums, exp);
        exp *= 10;
    }
}

/* 실행 예제 */
fn main() {
    // 기수 정렬
    let mut nums = [
        10546151, 35663510, 42865989, 34862445, 81883077, 88906420, 72429244, 30524779, 82060337,
        63832996,
    ];
    radix_sort(&mut nums);
    print!("기수 정렬 후 nums = ");
    print_util::print_array(&nums);
}
