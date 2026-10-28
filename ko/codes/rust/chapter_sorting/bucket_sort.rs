/*
 * File: bucket_sort.rs
 * Created Time: 2023-07-09
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* 버킷 정렬 */
fn bucket_sort(nums: &mut [f64]) {
    // 버킷 k = n/2개를 초기화하며, 각 버킷에 원소 2개가 배정될 것으로 예상한다
    let k = nums.len() / 2;
    let mut buckets = vec![vec![]; k];
    // 1. 배열 원소를 각 버킷에 배정한다
    for &num in nums.iter() {
        // 입력 데이터의 범위는 [0, 1)이며, num * k를 사용하여 인덱스 범위 [0, k-1]에 대응시킨다
        let i = (num * k as f64) as usize;
        // num을 버킷 i에 추가한다
        buckets[i].push(num);
    }
    // 2. 각 버킷을 정렬한다
    for bucket in &mut buckets {
        // 내장 정렬 함수를 사용하며, 다른 정렬 알고리즘으로 대체할 수도 있다
        bucket.sort_by(|a, b| a.partial_cmp(b).unwrap());
    }
    // 3. 버킷을 순회하여 결과를 합친다
    let mut i = 0;
    for bucket in buckets.iter() {
        for &num in bucket.iter() {
            nums[i] = num;
            i += 1;
        }
    }
}

/* 실행 코드 */
fn main() {
    // 입력 데이터는 범위가 [0, 1)인 부동 소수점 수라고 가정한다
    let mut nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37];
    bucket_sort(&mut nums);
    print!("버킷 정렬을 마친 후 nums = ");
    print_util::print_array(&nums);
}
