/**
 * File: top_k.ts
 * Created Time: 2023-08-13
 * Author: Justin (xiefahit@gmail.com)
 */

import { MaxHeap } from './my_heap';

/* 基于堆查找数组中最大的 k 个元素 */
function top_k_heap(nums: number[], k: number): number[] {
    // 使用大顶堆 MaxHeap，对数组 nums 取相反数
    const invertedNums = nums.map(num => -num);
    // 将数组的前 k 个元素入堆
    const heap = new MaxHeap(invertedNums.slice(0, k));
    // 从第 k+1 个元素开始，保持堆的长度为 k
    for (let i = k; i < invertedNums.length; i++) {
        // 若当前元素小于堆顶元素，则将堆顶元素出堆、当前元素入堆
        if (invertedNums[i] < heap.peek()) {
            heap.pop();
            heap.push(invertedNums[i]);
        }
    }

    // 对堆取相反数
    return heap.invertedNums();
}

/* Driver Code */
const nums = [1, 7, 6, 3, 2];
const k = 3;
const res = top_k_heap(nums, k);
console.log(`最大的 ${k} 个元素为`, res);
