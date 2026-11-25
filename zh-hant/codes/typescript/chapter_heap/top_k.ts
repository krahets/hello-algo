/**
 * File: top_k.ts
 * Created Time: 2023-08-13
 * Author: Justin (xiefahit@gmail.com)
 */

import { MaxHeap } from './my_heap';

/* 將元素加入堆積 */
function pushMinHeap(maxHeap: MaxHeap, val: number): void {
    // 將元素變號
    maxHeap.push(-val);
}

/* 從堆積取出元素 */
function popMinHeap(maxHeap: MaxHeap): number {
    // 將元素變號
    return -maxHeap.pop();
}

/* 讀取堆積頂端元素 */
function peekMinHeap(maxHeap: MaxHeap): number {
    // 將元素變號
    return -maxHeap.peek();
}

/* 取出堆積中的元素 */
function getMinHeap(maxHeap: MaxHeap): number[] {
    // 將元素變號
    return maxHeap.getMaxHeap().map((num: number) => -num);
}

/* 以堆積找出陣列中最大的 k 個元素 */
function topKHeap(nums: number[], k: number): number[] {
    // 初始化最小堆積
    // 注意：將堆積裡的所有元素變號，就能用最大堆積模擬最小堆積
    const maxHeap = new MaxHeap([]);
    // 將陣列的前 k 個元素加入堆積
    for (let i = 0; i < k; i++) {
        pushMinHeap(maxHeap, nums[i]);
    }
    // 從第 k+1 個元素開始，讓堆積大小維持在 k
    for (let i = k; i < nums.length; i++) {
        // 若目前元素大於堆積頂端元素，就取出頂端元素，再將目前元素加入堆積
        if (nums[i] > peekMinHeap(maxHeap)) {
            popMinHeap(maxHeap);
            pushMinHeap(maxHeap, nums[i]);
        }
    }
    // 回傳堆積中的元素
    return getMinHeap(maxHeap);
}

/* Driver Code */
const nums = [1, 7, 6, 3, 2];
const k = 3;
const res = topKHeap(nums, k);
console.log(`最大的 ${k} 個元素為`, res);
