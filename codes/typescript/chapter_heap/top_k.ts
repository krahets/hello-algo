/**
 * File: top_k.ts
 * Created Time: 2023-08-07
 * Author: Justin (xiefahit@gmail.com)
 */

class MinHeap {
    heap: number[];

    constructor() {
        this.heap = [];
    }

    push(val: number): void {
        this.heap.push(val);
        this.heap.sort((a, b) => a - b);
    }

    pop(): number | undefined {
        return this.heap.shift();
    }

    peek(): number {
        return this.heap[0];
    }

    size(): number {
        return this.heap.length;
    }
}

/* 基于堆查找数组中最大的 k 个元素 */
function topKHeap(nums: number[], k: number): number[] {
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
const nums: number[] = [1, 7, 6, 3, 2];
const k: number = 3;

const res: number[] = topKHeap(nums, k);
console.log(`最大的 ${k} 个元素为`, res);

export { };