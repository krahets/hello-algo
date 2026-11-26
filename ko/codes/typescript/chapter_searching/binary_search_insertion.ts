/**
 * File: binary_search_insertion.ts
 * Created Time: 2023-08-22
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

import { pathToFileURL } from 'node:url';

/* 이진 탐색으로 삽입 위치 찾기(중복 원소가 없는 경우) */
function binarySearchInsertionSimple(
    nums: Array<number>,
    target: number
): number {
    let i = 0,
        j = nums.length - 1; // 닫힌구간 [0, n-1]을 초기화한다.
    while (i <= j) {
        const m = Math.floor(i + (j - i) / 2); // Math.floor()로 소수점 이하를 버려 중점 인덱스 m을 구한다.
        if (nums[m] < target) {
            i = m + 1; // target을 찾을 구간은 [m+1, j]이다.
        } else if (nums[m] > target) {
            j = m - 1; // target을 찾을 구간은 [i, m-1]이다.
        } else {
            return m; // target을 찾았으므로 삽입 위치 m을 반환한다.
        }
    }
    // target을 찾지 못했으므로 삽입 위치 i를 반환한다.
    return i;
}

/* 이진 탐색으로 삽입 위치 찾기(중복 원소가 있는 경우) */
function binarySearchInsertion(nums: Array<number>, target: number): number {
    let i = 0,
        j = nums.length - 1; // 닫힌구간 [0, n-1]을 초기화한다.
    while (i <= j) {
        const m = Math.floor(i + (j - i) / 2); // Math.floor()로 소수점 이하를 버려 중점 인덱스 m을 구한다.
        if (nums[m] < target) {
            i = m + 1; // target을 찾을 구간은 [m+1, j]이다.
        } else if (nums[m] > target) {
            j = m - 1; // target을 찾을 구간은 [i, m-1]이다.
        } else {
            j = m - 1; // target보다 작은 원소 중 가장 오른쪽 원소를 찾을 구간은 [i, m-1]이다.
        }
    }
    // 삽입 위치 i를 반환한다.
    return i;
}

/* 실행 예제 */
if (process.argv[1] && import.meta.url === pathToFileURL(process.argv[1]).href) {
    // 중복 원소가 없는 배열
    let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
    console.log('\n배열 nums = ' + nums);
    // 이진 탐색으로 삽입 위치 찾기
    for (const target of [6, 9]) {
        const index = binarySearchInsertionSimple(nums, target);
        console.log('삽입할 값 = ' + target + ' | 삽입 인덱스 = ' + index);
    }

    // 중복 원소가 있는 배열
    nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
    console.log('\n배열 nums = ' + nums);
    // 이진 탐색으로 삽입 위치 찾기
    for (const target of [2, 6, 20]) {
        const index = binarySearchInsertion(nums, target);
        console.log('삽입할 값 = ' + target + ' | 삽입 인덱스 = ' + index);
    }
}

export { binarySearchInsertion };
