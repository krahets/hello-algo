/**
 * File: list.ts
 * Created Time: 2022-12-10
 * Author: Justin (xiefahit@gmail.com)
 */

/* リストを初期化 */
const nums: number[] = [1, 3, 2, 5, 4];
console.log(`リスト nums = ${nums}`);

/* 要素にアクセス */
const num: number = nums[1];
console.log(`インデックス 1 の要素にアクセスすると、num = ${num}`);

/* 要素を更新 */
nums[1] = 0;
console.log(`インデックス 1 の要素を 0 に更新すると、nums = ${nums}`);

/* リストを空にする */
nums.length = 0;
console.log(`リストを空にすると nums = ${nums}`);

/* 末尾に要素を追加 */
nums.push(1);
nums.push(3);
nums.push(2);
nums.push(5);
nums.push(4);
console.log(`要素を追加すると nums = ${nums}`);

/* 中間に要素を挿入 */
nums.splice(3, 0, 6);
console.log(`インデックス 3 に数字 6 を挿入すると、nums = ${nums}`);

/* 要素を削除 */
nums.splice(3, 1);
console.log(`インデックス 3 の要素を削除すると、nums = ${nums}`);

/* インデックスでリストを走査 */
let count = 0;
for (let i = 0; i < nums.length; i++) {
    count += nums[i];
}
/* リスト要素を直接走査 */
count = 0;
for (const x of nums) {
    count += x;
}

/* 2 つのリストを連結する */
const nums1: number[] = [6, 8, 7, 10, 9];
nums.push(...nums1);
console.log(`リスト nums1 を nums の後ろに連結すると、nums = ${nums}`);

/* リストをソート */
nums.sort((a, b) => a - b);
console.log(`リストをソートすると nums = ${nums}`);

export {};
