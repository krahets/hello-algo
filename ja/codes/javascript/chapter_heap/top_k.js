/**
 * File: top_k.js
 * Created Time: 2023-08-13
 * Author: Justin (xiefahit@gmail.com)
 */

const { MaxHeap } = require('./my_heap');

/* 要素をヒープに挿入する */
function pushMinHeap(maxHeap, val) {
    // 要素の符号を反転する
    maxHeap.push(-val);
}

/* 根の要素をヒープから取り出す */
function popMinHeap(maxHeap) {
    // 要素の符号を反転する
    return -maxHeap.pop();
}

/* ヒープの根の要素を参照する */
function peekMinHeap(maxHeap) {
    // 要素の符号を反転する
    return -maxHeap.peek();
}

/* ヒープから要素を取り出す */
function getMinHeap(maxHeap) {
    // 要素の符号を反転する
    return maxHeap.getMaxHeap().map((num) => -num);
}

/* ヒープを使って配列の上位 k 個の要素を求める */
function topKHeap(nums, k) {
    // 最小ヒープを初期化する
    // すべての要素の符号を反転し、最大ヒープで最小ヒープを模擬する
    const maxHeap = new MaxHeap([]);
    // 配列の先頭 k 個の要素をヒープに入れる
    for (let i = 0; i < k; i++) {
        pushMinHeap(maxHeap, nums[i]);
    }
    // k+1 番目の要素からはヒープのサイズを k に保つ
    for (let i = k; i < nums.length; i++) {
        // 現在の要素が根の要素より大きければ、根の要素を取り出して現在の要素を挿入する
        if (nums[i] > peekMinHeap(maxHeap)) {
            popMinHeap(maxHeap);
            pushMinHeap(maxHeap, nums[i]);
        }
    }
    // ヒープ内の要素を返す
    return getMinHeap(maxHeap);
}

/* 実行例 */
const nums = [1, 7, 6, 3, 2];
const k = 3;
const res = topKHeap(nums, k);
console.log(`上位 ${k} 個の要素：`, res);
