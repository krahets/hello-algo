/**
 * File: array.ts
 * Created Time: 2022-12-04
 * Author: Justin (xiefahit@gmail.com)
 */

/* 要素へランダムアクセス */
function randomAccess(nums: number[]): number {
    // 区間 [0, nums.length) からランダムに 1 つの数を選ぶ
    const random_index = Math.floor(Math.random() * nums.length);
    // ランダムな要素を取得して返す
    const random_num = nums[random_index];
    return random_num;
}

/* 配列長を拡張する */
// TypeScript の Array は動的配列であり、直接拡張できます
// 学習しやすいよう、本関数では Array を長さ不変の配列として扱います
function extend(nums: number[], enlarge: number): number[] {
    // 拡張後の長さを持つ配列を初期化する
    const res = new Array(nums.length + enlarge).fill(0);
    // 元の配列の全要素を新しい配列にコピー
    for (let i = 0; i < nums.length; i++) {
        res[i] = nums[i];
    }
    // 拡張後の新しい配列を返す
    return res;
}

/* 配列の index 番目に要素 num を挿入 */
function insert(nums: number[], num: number, index: number): void {
    // インデックス index 以降の全要素を 1 つ後ろへ移動する
    for (let i = nums.length - 1; i > index; i--) {
        nums[i] = nums[i - 1];
    }
    // index の要素に num を代入する
    nums[index] = num;
}

/* index の要素を削除する */
function remove(nums: number[], index: number): void {
    // インデックス index より後ろの全要素を 1 つ前へ移動する
    for (let i = index; i < nums.length - 1; i++) {
        nums[i] = nums[i + 1];
    }
}

/* 配列を走査 */
function traverse(nums: number[]): void {
    let count = 0;
    // インデックスで配列を走査
    for (let i = 0; i < nums.length; i++) {
        count += nums[i];
    }
    // 配列要素を直接走査
    for (const num of nums) {
        count += num;
    }
}

/* 配列内で指定要素を探す */
function find(nums: number[], target: number): number {
    for (let i = 0; i < nums.length; i++) {
        if (nums[i] === target) {
            return i;
        }
    }
    return -1;
}

/* Driver Code */
/* 配列を初期化 */
const arr: number[] = new Array(5).fill(0);
console.log('配列 arr =', arr);
let nums: number[] = [1, 3, 2, 5, 4];
console.log('配列 nums =', nums);

/* ランダムアクセス */
let random_num = randomAccess(nums);
console.log('nums からランダムな要素を取得', random_num);

/* 長さを拡張 */
nums = extend(nums, 3);
console.log('配列の長さを 8 に拡張すると、nums =', nums);

/* 要素を挿入する */
insert(nums, 6, 3);
console.log('インデックス 3 に数字 6 を挿入すると、nums =', nums);

/* 要素を削除 */
remove(nums, 2);
console.log('インデックス 2 の要素を削除すると、nums =', nums);

/* 配列を走査 */
traverse(nums);

/* 要素を探索する */
let index = find(nums, 3);
console.log('nums 内で要素 3 を検索すると、インデックス =', index);

export {};
