/**
 * File: two_sum.ts
 * Created Time: 2022-12-15
 * Author: gyt95 (gytkwan@gmail.com)
 */

/* 방법 1: 완전 열거 */
function twoSumBruteForce(nums: number[], target: number): number[] {
    const n = nums.length;
    // 이중 반복문이며 시간 복잡도는 O(n^2)이다
    for (let i = 0; i < n; i++) {
        for (let j = i + 1; j < n; j++) {
            if (nums[i] + nums[j] === target) {
                return [i, j];
            }
        }
    }
    return [];
}

/* 방법 2: 보조 해시 테이블 */
function twoSumHashTable(nums: number[], target: number): number[] {
    // 보조 해시 테이블의 공간 복잡도는 O(n)이다
    let m: Map<number, number> = new Map();
    // 단일 반복문이며 시간 복잡도는 O(n)이다
    for (let i = 0; i < nums.length; i++) {
        let index = m.get(target - nums[i]);
        if (index !== undefined) {
            return [index, i];
        } else {
            m.set(nums[i], i);
        }
    }
    return [];
}

/* 실행 코드 */
// 방법 1
const nums = [2, 7, 11, 15],
    target = 13;

let res = twoSumBruteForce(nums, target);
console.log('방법 1 res = ', res);

// 방법 2
res = twoSumHashTable(nums, target);
console.log('방법 2 res = ', res);

export {};
