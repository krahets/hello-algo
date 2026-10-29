/**
 * File: top_k.ts
 * Created Time: 2023-08-13
 * Author: Justin (xiefahit@gmail.com)
 */

import { MaxHeap } from './my_heap';

/* ヒープに要素を挿入する */
function pushMinHeap(maxHeap: MaxHeap, val: number): void {
    // 要素の符号を反転する
    maxHeap.push(-val);
}

/* ヒープから要素を取り出す */
function popMinHeap(maxHeap: MaxHeap): number {
    // 要素の符号を反転する
    return -maxHeap.pop();
}

/* ヒープの先頭要素にアクセスする */
function peekMinHeap(maxHeap: MaxHeap): number {
    // 要素の符号を反転する
    return -maxHeap.peek();
}

/* ヒープ内の要素を取り出す */
function getMinHeap(maxHeap: MaxHeap): number[] {
    // 要素の符号を反転する
    return maxHeap.getMaxHeap().map((num: number) => -num);
}

/* ヒープを使って配列内の大きいほうから k 個の要素を求める */
function topKHeap(nums: number[], k: number): number[] {
    // 最小ヒープを初期化する
    // 注意：ヒープの全要素の符号を反転することで、最大ヒープを使って最小ヒープを再現する
    const maxHeap = new MaxHeap([]);
    // 配列の先頭 k 個の要素をヒープに挿入する
    for (let i = 0; i < k; i++) {
        pushMinHeap(maxHeap, nums[i]);
    }
    // k+1 番目の要素から始め、ヒープの長さを k に保つ
    for (let i = k; i < nums.length; i++) {
        // 現在の要素がヒープの先頭要素より大きい場合、先頭要素を取り出し、現在の要素を挿入する
        if (nums[i] > peekMinHeap(maxHeap)) {
            popMinHeap(maxHeap);
            pushMinHeap(maxHeap, nums[i]);
        }
    }
    // ヒープ内の要素を返す
    return getMinHeap(maxHeap);
}

/* 実行用コード */
const nums = [1, 7, 6, 3, 2];
const k = 3;
const res = topKHeap(nums, k);
console.log(`大きいほうから ${k} 個の要素は`, res);
