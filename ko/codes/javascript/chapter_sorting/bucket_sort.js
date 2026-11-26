/**
 * File: bucket_sort.js
 * Created Time: 2023-04-08
 * Author: Justin (xiefahit@gmail.com)
 */

/* 버킷 정렬 */
function bucketSort(nums) {
    // 버킷 k = n/2개를 초기화하여 버킷당 평균 두 원소를 배분할 것으로 예상
    const k = nums.length / 2;
    const buckets = [];
    for (let i = 0; i < k; i++) {
        buckets.push([]);
    }
    // 1. 배열 원소를 각 버킷에 배분
    for (const num of nums) {
        // 입력 범위는 [0, 1)이며 num * k로 인덱스 범위 [0, k-1]에 대응시킴
        const i = Math.floor(num * k);
        // num을 버킷 i에 추가
        buckets[i].push(num);
    }
    // 2. 각 버킷을 정렬
    for (const bucket of buckets) {
        // 내장 정렬 함수를 사용하며 다른 정렬 알고리즘으로 대체 가능
        bucket.sort((a, b) => a - b);
    }
    // 3. 버킷을 순회하여 결과 병합
    let i = 0;
    for (const bucket of buckets) {
        for (const num of bucket) {
            nums[i++] = num;
        }
    }
}

/* 실행 예제 */
const nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37];
bucketSort(nums);
console.log('버킷 정렬 후 nums =', nums);
