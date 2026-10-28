/**
 * File: binary_search.ts
 * Created Time: 2022-12-27
 * Author: Daniel (better.sunjian@gmail.com)
 */

/* 이진 탐색(양 끝을 포함하는 닫힌 구간) */
function binarySearch(nums: number[], target: number): number {
    // 닫힌 구간 [0, n-1]을 초기화한다. i와 j는 각각 배열의 첫 원소와 마지막 원소를 가리킨다
    let i = 0,
        j = nums.length - 1;
    // 반복하다 탐색 구간이 비면 종료한다(i > j이면 빈 구간이다)
    while (i <= j) {
        // 중간 인덱스 m을 계산한다
        const m = Math.floor(i + (j - i) / 2);
        if (nums[m] < target) {
            // 이 경우 target은 구간 [m+1, j]에 있다
            i = m + 1;
        } else if (nums[m] > target) {
            // 이 경우 target은 구간 [i, m-1]에 있다
            j = m - 1;
        } else {
            // 목표 원소를 찾았으므로 해당 인덱스를 반환한다
            return m;
        }
    }
    return -1; // 목표 원소를 찾지 못했으므로 -1을 반환한다
}

/* 이진 탐색(왼쪽 끝은 포함하고 오른쪽 끝은 제외하는 구간) */
function binarySearchLCRO(nums: number[], target: number): number {
    // 왼쪽 끝만 포함하는 구간 [0, n)을 초기화한다. i는 배열의 첫 원소를, j는 마지막 원소 바로 다음 위치를 가리킨다
    let i = 0,
        j = nums.length;
    // 반복하다 탐색 구간이 비면 종료한다(i = j이면 빈 구간이다)
    while (i < j) {
        // 중간 인덱스 m을 계산한다
        const m = Math.floor(i + (j - i) / 2);
        if (nums[m] < target) {
            // 이 경우 target은 구간 [m+1, j)에 있다
            i = m + 1;
        } else if (nums[m] > target) {
            // 이 경우 target은 구간 [i, m)에 있다
            j = m;
        } else {
            // 목표 원소를 찾았으므로 해당 인덱스를 반환한다
            return m;
        }
    }
    return -1; // 목표 원소를 찾지 못했으므로 -1을 반환한다
}

/* 실행 코드 */
const target = 6;
const nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

/* 이진 탐색(양 끝을 포함하는 닫힌 구간) */
let index = binarySearch(nums, target);
console.info('목표 원소 6의 인덱스 = %d', index);

/* 이진 탐색(왼쪽 끝은 포함하고 오른쪽 끝은 제외하는 구간) */
index = binarySearchLCRO(nums, target);
console.info('목표 원소 6의 인덱스 = %d', index);

export {};
