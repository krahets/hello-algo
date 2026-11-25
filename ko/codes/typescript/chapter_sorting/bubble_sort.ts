/**
 * File: bubble_sort.ts
 * Created Time: 2022-12-12
 * Author: Justin (xiefahit@gmail.com)
 */

/* 버블 정렬 */
function bubbleSort(nums: number[]): void {
    // 바깥 루프: 미정렬 구간은 [0, i]
    for (let i = nums.length - 1; i > 0; i--) {
        // 안쪽 루프: 미정렬 구간 [0, i]의 최댓값을 교환을 통해 구간의 오른쪽 끝으로 이동
        for (let j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // nums[j]와 nums[j + 1] 교환
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
            }
        }
    }
}

/* 플래그로 최적화한 버블 정렬*/
function bubbleSortWithFlag(nums: number[]): void {
    // 바깥 루프: 미정렬 구간은 [0, i]
    for (let i = nums.length - 1; i > 0; i--) {
        let flag = false; // 플래그 초기화
        // 안쪽 루프: 미정렬 구간 [0, i]의 최댓값을 교환을 통해 구간의 오른쪽 끝으로 이동
        for (let j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // nums[j]와 nums[j + 1] 교환
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                flag = true; // 원소가 교환되었음을 기록
            }
        }
        if (!flag) break; // 이 회전에서 교환이 한 번도 없으면 바로 종료
    }
}

/* 실행 예제 */
const nums = [4, 1, 3, 1, 5, 2];
bubbleSort(nums);
console.log('버블 정렬 후 nums =', nums);

const nums1 = [4, 1, 3, 1, 5, 2];
bubbleSortWithFlag(nums1);
console.log('버블 정렬 후 nums =', nums1);

export {};
