/**
 * File: top_k.js
 * Created Time: 2023-08-13
 * Author: Justin (xiefahit@gmail.com)
 */

const { MaxHeap } = require('./my_heap');

/* 元素入堆 */
function pushMinHeap(maxHeap, val) {
    // 元素取反
    maxHeap.push(-val);
}

/* 元素出堆 */
function popMinHeap(maxHeap) {
    // 元素取反
    return -maxHeap.pop();
}

/* 访问堆顶元素 */
function peekMinHeap(maxHeap) {
    // 元素取反
    return -maxHeap.peek();
}

/* 取出堆中元素 */
function getMinHeap(maxHeap) {
    // 元素取反
    return maxHeap.getMaxHeap().map((num) => -num);
}

/* 基于堆查找数组中最大的 k 个元素 */
function topKHeap(nums, k) {
    // 初始化小顶堆
    // 请注意：我们将堆中所有元素取反，从而用大顶堆来模拟小顶堆
    const maxHeap = new MaxHeap([]);
    // 将数组的前 k 个元素入堆
    for (let i = 0; i < k; i++) {
        pushMinHeap(maxHeap, nums[i]);
    }
    // 从第 k+1 个元素开始，保持堆的长度为 k
    for (let i = k; i < nums.length; i++) {
        // 若当前元素大于堆顶元素，则将堆顶元素出堆、当前元素入堆
        if (nums[i] > peekMinHeap(maxHeap)) {
            popMinHeap(maxHeap);
            pushMinHeap(maxHeap, nums[i]);
        }
    }
    // 返回堆中元素
    return getMinHeap(maxHeap);
}

/* Driver Code */
const nums = [1, 7, 6, 3, 2];
const k = 3;
const res = topKHeap(nums, k);
console.log(`最大的 ${k} 个元素为`, res);
