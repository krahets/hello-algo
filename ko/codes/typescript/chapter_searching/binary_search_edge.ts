/**
 * File: binary_search_edge.ts
 * Created Time: 2023-08-22
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */
import { binarySearchInsertion } from './binary_search_insertion';

/* 이진 탐색으로 가장 왼쪽의 target 찾기 */
function binarySearchLeftEdge(nums: Array<number>, target: number): number {
    // target의 삽입 위치를 찾는 것과 같다.
    const i = binarySearchInsertion(nums, target);
    // target을 찾지 못했으므로 -1을 반환한다.
    if (i === nums.length || nums[i] !== target) {
        return -1;
    }
    // target을 찾았으므로 인덱스 i를 반환한다.
    return i;
}

/* 이진 탐색으로 가장 오른쪽의 target 찾기 */
function binarySearchRightEdge(nums: Array<number>, target: number): number {
    // 가장 왼쪽의 target + 1을 찾는 문제로 바꾼다.
    const i = binarySearchInsertion(nums, target + 1);
    // j는 가장 오른쪽의 target을, i는 target보다 큰 첫 원소를 가리킨다.
    const j = i - 1;
    // target을 찾지 못했으므로 -1을 반환한다.
    if (j === -1 || nums[j] !== target) {
        return -1;
    }
    // target을 찾았으므로 인덱스 j를 반환한다.
    return j;
}

/* 실행 예제 */
// 중복 원소가 있는 배열
let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
console.log('\n배열 nums = ' + nums);
// 이진 탐색으로 왼쪽 경계와 오른쪽 경계 찾기
for (const target of [6, 7]) {
    let index = binarySearchLeftEdge(nums, target);
    console.log('찾을 값 = ' + target + ' | 첫 인덱스 = ' + index);
    index = binarySearchRightEdge(nums, target);
    console.log('찾을 값 = ' + target + ' | 마지막 인덱스 = ' + index);
}

export {};
