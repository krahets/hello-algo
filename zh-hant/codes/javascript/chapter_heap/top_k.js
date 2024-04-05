/**
 * File: top_k.js
 * Created Time: 2023-08-13
 * Author: Justin (xiefahit@gmail.com)
 */

const { MaxHeap } = require('./my_heap');

/* 元素入堆積 */
function pushMinHeap(maxHeap, val) {
    // 元素取反
    maxHeap.push(-val);
}

/* 元素出堆積 */
function popMinHeap(maxHeap) {
    // 元素取反
    return -maxHeap.pop();
}

/* 訪問堆積頂元素 */
function peekMinHeap(maxHeap) {
    // 元素取反
    return -maxHeap.peek();
}

/* 取出堆積中元素 */
function getMinHeap(maxHeap) {
    // 元素取反
    return maxHeap.getMaxHeap().map((num) => -num);
}

/* 基於堆積查詢陣列中最大的 k 個元素 */
function topKHeap(nums, k) {
    // 初始化小頂堆積
    // 請注意：我們將堆積中所有元素取反，從而用大頂堆積來模擬小頂堆積
    const maxHeap = new MaxHeap([]);
    // 將陣列的前 k 個元素入堆積
    for (let i = 0; i < k; i++) {
        pushMinHeap(maxHeap, nums[i]);
    }
    // 從第 k+1 個元素開始，保持堆積的長度為 k
    for (let i = k; i < nums.length; i++) {
        // 若當前元素大於堆積頂元素，則將堆積頂元素出堆積、當前元素入堆積
        if (nums[i] > peekMinHeap(maxHeap)) {
            popMinHeap(maxHeap);
            pushMinHeap(maxHeap, nums[i]);
        }
    }
    // 返回堆積中元素
    return getMinHeap(maxHeap);
}

/* Driver Code */
const nums = [1, 7, 6, 3, 2];
const k = 3;
const res = topKHeap(nums, k);
console.log(`最大的 ${k} 個元素為`, res);
