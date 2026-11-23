/**
 * File: binary_search_recur.js
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* 이진 탐색: 문제 f(i, j) */
function dfs(nums, target, i, j) {
    // 구간이 비어 있으면 목표 원소가 없다는 뜻이므로 -1을 반환한다
    if (i > j) {
        return -1;
    }
    // 중간 인덱스 m을 계산한다
    const m = i + ((j - i) >> 1);
    if (nums[m] < target) {
        // 부분 문제 f(m+1, j)를 재귀적으로 푼다
        return dfs(nums, target, m + 1, j);
    } else if (nums[m] > target) {
        // 부분 문제 f(i, m-1)를 재귀적으로 푼다
        return dfs(nums, target, i, m - 1);
    } else {
        // 목표 원소를 찾았으므로 해당 인덱스를 반환한다
        return m;
    }
}

/* 이진 탐색 */
function binarySearch(nums, target) {
    const n = nums.length;
    // 문제 f(0, n-1)을 푼다
    return dfs(nums, target, 0, n - 1);
}

/* 실행 코드 */
const target = 6;
const nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
// 이진 탐색(양 끝을 포함하는 닫힌 구간)
const index = binarySearch(nums, target);
console.log(`목표 원소 6의 인덱스 = ${index}`);
