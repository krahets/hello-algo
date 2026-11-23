/**
 * File: selection_sort.ts
 * Created Time: 2023-06-04
 * Author: Justin (xiefahit@gmail.com)
 */

/* 선택 정렬 */
function selectionSort(nums: number[]): void {
    let n = nums.length;
    // 바깥쪽 반복문: 정렬되지 않은 구간은 [i, n-1]이다
    for (let i = 0; i < n - 1; i++) {
        // 안쪽 반복문: 정렬되지 않은 구간의 최솟값을 찾는다
        let k = i;
        for (let j = i + 1; j < n; j++) {
            if (nums[j] < nums[k]) {
                k = j; // 최솟값의 인덱스를 기록한다
            }
        }
        // 이 최솟값과 정렬되지 않은 구간의 첫 원소를 교환한다
        [nums[i], nums[k]] = [nums[k], nums[i]];
    }
}

/* 실행 코드 */
const nums: number[] = [4, 1, 3, 1, 5, 2];
selectionSort(nums);
console.log('선택 정렬을 마친 후 nums =', nums);

export {};
