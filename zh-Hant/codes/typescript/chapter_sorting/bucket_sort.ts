/**
 * File: bucket_sort.ts
 * Created Time: 2023-04-08
 * Author: Justin (xiefahit@gmail.com)
 */

/* 桶排序 */
function bucketSort(nums: number[]): void {
    // 初始化 k = n/2 個桶，預期向每個桶分配 2 個元素
    const k = nums.length / 2;
    const buckets: number[][] = [];
    for (let i = 0; i < k; i++) {
        buckets.push([]);
    }
    // 1. 將陣列元素分配到各個桶中
    for (const num of nums) {
        // 輸入資料範圍為 [0, 1)，使用 num * k 對映到索引範圍 [0, k-1]
        const i = Math.floor(num * k);
        // 將 num 新增進桶 i
        buckets[i].push(num);
    }
    // 2. 對各個桶執行排序
    for (const bucket of buckets) {
        // 使用內建排序函式，也可以替換成其他排序演算法
        bucket.sort((a, b) => a - b);
    }
    // 3. 走訪桶合併結果
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
console.log('桶排序完成後 nums =', nums);

export {};
