/**
 * File: top_k.js
 * Created Time: 2023-08-13
 * Author: Justin (xiefahit@gmail.com)
 */

const { MaxHeap } = require('./my_heap');

/* 要素をヒープに追加 */
function pushMinHeap(maxHeap, val) {
    // 要素を反転する
    maxHeap.push(-val);
}

/* 要素をヒープから取り出す */
function popMinHeap(maxHeap) {
    // 要素を反転する
    return -maxHeap.pop();
}

/* ヒープ先頭要素にアクセス */
function peekMinHeap(maxHeap) {
    // 要素を反転する
    return -maxHeap.peek();
}

/* ヒープから要素を取り出す */
function getMinHeap(maxHeap) {
    // 要素を反転する
    return maxHeap.getMaxHeap().map((num) => -num);
}

/* ヒープに基づいて配列中の最大の k 個の要素を探す */
function topKHeap(nums, k) {
    // 最小ヒープを初期化する
    // 注意: ヒープ内の全要素を反転し、最大ヒープで最小ヒープをシミュレートする
    const maxHeap = new MaxHeap([]);
    // 配列の先頭 k 個の要素をヒープに追加
    for (let i = 0; i < k; i++) {
        pushMinHeap(maxHeap, nums[i]);
    }
    // k+1 番目の要素から開始し、ヒープ長を k に保つ
    for (let i = k; i < nums.length; i++) {
        // 現在の要素がヒープ先頭より大きければ、ヒープ先頭を取り出して現在の要素を追加する
        if (nums[i] > peekMinHeap(maxHeap)) {
            popMinHeap(maxHeap);
            pushMinHeap(maxHeap, nums[i]);
        }
    }
    // ヒープ内の要素を返す
    return getMinHeap(maxHeap);
}

/* Driver Code */
const nums = [1, 7, 6, 3, 2];
const k = 3;
const res = topKHeap(nums, k);
console.log(`最大の ${k} 個の要素は`, res);
