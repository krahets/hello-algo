/**
 * File: selection_sort.ts
 * Created Time: 2023-06-04
 * Author: Justin (xiefahit@gmail.com)
 */

/* 선택 정렬 */
function selectionSort(nums: number[]): void {
    let n = nums.length;
    // 바깥 루프: 미정렬 구간은 [i, n-1]
    for (let i = 0; i < n - 1; i++) {
        // 안쪽 루프: 미정렬 구간에서 최솟값 찾기
        let k = i;
        for (let j = i + 1; j < n; j++) {
            if (nums[j] < nums[k]) {
                k = j; // 최솟값의 인덱스 기록
            }
        }
        // 최솟값과 미정렬 구간의 첫 원소 교환
        [nums[i], nums[k]] = [nums[k], nums[i]];
    }
}

/* 실행 예제 */
const nums: number[] = [4, 1, 3, 1, 5, 2];
selectionSort(nums);
console.log('선택 정렬 후 nums =', nums);

export {};
