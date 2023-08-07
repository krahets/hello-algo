/**
 * File: top_k.js
 * Created Time: 2023-08-07
 * Author: Justin (xiefahit@gmail.com)
 */

class MinHeap {
    constructor() {
        this.heap = [];
    }

    push(val) {
        this.heap.push(val);
        this.heap.sort((a, b) => a - b);
    }

    pop() {
        return this.heap.shift();
    }

    peek() {
        return this.heap[0];
    }

    size() {
        return this.heap.length;
    }
}

/* 基于堆查找数组中最大的 k 个元素 */
function topKHeap(nums, k) {
    const heap = new MinHeap();
    // 将数组的前 k 个元素入堆
    for (let i = 0; i < k; i++) {
        heap.push(nums[i]);
    }
    // 从第 k+1 个元素开始，保持堆的长度为 k
    for (let i = k; i < nums.length; i++) {
        // 若当前元素大于堆顶元素，则将堆顶元素出堆、当前元素入堆
        if (nums[i] > heap.peek()) {
            heap.pop();
            heap.push(nums[i]);
        }
    }
    return heap.heap;
}

// Driver Code
const nums = [1, 7, 6, 3, 2];
const k = 3;

const res = topKHeap(nums, k);
console.log(`最大的 ${k} 个元素为`, res);
