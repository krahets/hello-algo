/**
 * File: bucket_sort.ts
 * Created Time: 2023-04-08
 * Author: Justin (xiefahit@gmail.com)
 */

/* バケットソート */
function bucketSort(nums: number[]): void {
    // k = n/2 個のバケットを初期化。各バケットには平均 2 要素が入る想定
    const k = nums.length / 2;
    const buckets: number[][] = [];
    for (let i = 0; i < k; i++) {
        buckets.push([]);
    }
    // 1. 配列の要素を各バケットに振り分ける
    for (const num of nums) {
        // 入力範囲は [0, 1)。num * k でインデックスの範囲 [0, k-1] に写す
        const i = Math.floor(num * k);
        // num をバケット i に追加
        buckets[i].push(num);
    }
    // 2. 各バケットをソートする
    for (const bucket of buckets) {
        // 組み込みのソート関数を使用。他のソートアルゴリズムでもよい
        bucket.sort((a, b) => a - b);
    }
    // 3. バケットを順に連結
    let i = 0;
    for (const bucket of buckets) {
        for (const num of bucket) {
            nums[i++] = num;
        }
    }
}

/* 実行例 */
const nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37];
bucketSort(nums);
console.log('バケットソート後の nums =', nums);

export {};
