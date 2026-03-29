/**
 * File: bucket_sort.js
 * Created Time: 2023-04-08
 * Author: Justin (xiefahit@gmail.com)
 */

/* バケットソート */
function bucketSort(nums) {
    // k = n/2 個のバケットを初期化し、各バケットに 2 要素ずつ割り当てる想定とする
    const k = nums.length / 2;
    const buckets = [];
    for (let i = 0; i < k; i++) {
        buckets.push([]);
    }
    // 1. 配列要素を各バケットに振り分ける
    for (const num of nums) {
        // 入力データの範囲は [0, 1) であり、num * k を用いてインデックス範囲 [0, k-1] に写像する
        const i = Math.floor(num * k);
        // num をバケット i に追加
        buckets[i].push(num);
    }
    // 2. 各バケットをソートする
    for (const bucket of buckets) {
        // 組み込みのソート関数を使う。他のソートアルゴリズムに置き換えてもよい
        bucket.sort((a, b) => a - b);
    }
    // 3. バケットを走査して結果を結合
    let i = 0;
    for (const bucket of buckets) {
        for (const num of bucket) {
            nums[i++] = num;
        }
    }
}

/* Driver Code */
const nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37];
bucketSort(nums);
console.log('バケットソート完了後 nums =', nums);
