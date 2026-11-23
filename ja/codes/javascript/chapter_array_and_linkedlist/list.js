/**
 * File: list.js
 * Created Time: 2022-12-12
 * Author: Justin (xiefahit@gmail.com)
 */

/* リストを初期化する */
const nums = [1, 3, 2, 5, 4];
console.log(`リスト nums = ${nums}`);

/* 要素にアクセスする */
const num = nums[1];
console.log(`インデックス 1 の要素にアクセスした結果 num = ${num}`);

/* 要素を更新する */
nums[1] = 0;
console.log(`インデックス 1 の要素を 0 に更新した結果 nums = ${nums}`);

/* リストを空にする */
nums.length = 0;
console.log(`リストを空にした後 nums = ${nums}`);

/* 末尾に要素を追加する */
nums.push(1);
nums.push(3);
nums.push(2);
nums.push(5);
nums.push(4);
console.log(`要素を追加した後 nums = ${nums}`);

/* 途中に要素を挿入する */
nums.splice(3, 0, 6);
console.log(`インデックス 3 に数値 6 を挿入した結果 nums = ${nums}`);

/* 要素を削除する */
nums.splice(3, 1);
console.log(`インデックス 3 の要素を削除した結果 nums = ${nums}`);

/* インデックスを使ってリストを走査する */
let count = 0;
for (let i = 0; i < nums.length; i++) {
    count += nums[i];
}
/* リストの要素を直接走査する */
count = 0;
for (const x of nums) {
    count += x;
}

/* 2 つのリストを連結する */
const nums1 = [6, 8, 7, 10, 9];
nums.push(...nums1);
console.log(`リスト nums の後ろに nums1 を連結した結果 nums = ${nums}`);

/* リストをソートする */
nums.sort((a, b) => a - b);
console.log(`リストをソートした後 nums = ${nums}`);
