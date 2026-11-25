/*
 * File: bucket_sort.rs
 * Created Time: 2023-07-09
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* 버킷 정렬 */
fn bucket_sort(nums: &mut [f64]) {
    // 버킷 k = n/2개를 초기화하여 버킷당 평균 두 원소를 배분할 것으로 예상
    let k = nums.len() / 2;
    let mut buckets = vec![vec![]; k];
    // 1. 배열 원소를 각 버킷에 배분
    for &num in nums.iter() {
        // 입력 범위는 [0, 1)이며 num * k로 인덱스 범위 [0, k-1]에 대응시킴
        let i = (num * k as f64) as usize;
        // num을 버킷 i에 추가
        buckets[i].push(num);
    }
    // 2. 각 버킷을 정렬
    for bucket in &mut buckets {
        // 내장 정렬 함수를 사용하며 다른 정렬 알고리즘으로 대체 가능
        bucket.sort_by(|a, b| a.partial_cmp(b).unwrap());
    }
    // 3. 버킷을 순회하여 결과 병합
    let mut i = 0;
    for bucket in buckets.iter() {
        for &num in bucket.iter() {
            nums[i] = num;
            i += 1;
        }
    }
}

/* 실행 예제 */
fn main() {
    // 입력은 [0, 1) 범위의 부동 소수점 수로 가정
    let mut nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37];
    bucket_sort(&mut nums);
    print!("버킷 정렬 후 nums = ");
    print_util::print_array(&nums);
}
