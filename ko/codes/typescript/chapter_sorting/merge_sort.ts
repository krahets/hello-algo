/**
 * File: merge_sort.ts
 * Created Time: 2022-12-12
 * Author: Justin (xiefahit@gmail.com)
 */

/* 왼쪽 부분 배열과 오른쪽 부분 배열 병합 */
function merge(nums: number[], left: number, mid: number, right: number): void {
    // 왼쪽 부분 배열의 구간은 [left, mid]이고, 오른쪽 부분 배열의 구간은 [mid+1, right]이다
    // 병합 결과를 저장할 임시 배열 tmp를 생성한다
    const tmp = new Array(right - left + 1);
    // 왼쪽 부분 배열과 오른쪽 부분 배열의 시작 인덱스를 초기화한다
    let i = left,
        j = mid + 1,
        k = 0;
    // 양쪽 부분 배열 모두에 원소가 남아 있으면 비교하여 더 작은 원소를 임시 배열에 복사한다
    while (i <= mid && j <= right) {
        if (nums[i] <= nums[j]) {
            tmp[k++] = nums[i++];
        } else {
            tmp[k++] = nums[j++];
        }
    }
    // 왼쪽 부분 배열과 오른쪽 부분 배열의 남은 원소를 임시 배열에 복사한다
    while (i <= mid) {
        tmp[k++] = nums[i++];
    }
    while (j <= right) {
        tmp[k++] = nums[j++];
    }
    // 임시 배열 tmp의 원소를 원래 배열 nums의 해당 구간에 다시 복사한다
    for (k = 0; k < tmp.length; k++) {
        nums[left + k] = tmp[k];
    }
}

/* 병합 정렬 */
function mergeSort(nums: number[], left: number, right: number): void {
    // 종료 조건
    if (left >= right) return; // 부분 배열의 길이가 1이면 재귀를 종료한다
    // 분할 단계
    let mid = Math.floor(left + (right - left) / 2); // 중간 위치를 계산한다
    mergeSort(nums, left, mid); // 왼쪽 부분 배열에 재귀 호출한다
    mergeSort(nums, mid + 1, right); // 오른쪽 부분 배열에 재귀 호출한다
    // 병합 단계
    merge(nums, left, mid, right);
}

/* 실행 코드 */
const nums = [7, 3, 2, 6, 0, 1, 5, 4];
mergeSort(nums, 0, nums.length - 1);
console.log('병합 정렬을 마친 후 nums =', nums);

export {};
