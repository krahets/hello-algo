/**
 * File: heap_sort.ts
 * Created Time: 2023-06-04
 * Author: Justin (xiefahit@gmail.com)
 */

/* 長さ n のヒープを、ノード i から下向きにヒープ化する */
function siftDown(nums: number[], n: number, i: number): void {
    while (true) {
        // ノード i, l, r のうち値が最大のノードを求め、ma とする
        let l = 2 * i + 1;
        let r = 2 * i + 2;
        let ma = i;
        if (l < n && nums[l] > nums[ma]) {
            ma = l;
        }
        if (r < n && nums[r] > nums[ma]) {
            ma = r;
        }
        // ノード i が最大か添字 l, r が範囲外なら、ヒープ化は不要なので終了
        if (ma === i) {
            break;
        }
        // 2 つのノードを交換する
        [nums[i], nums[ma]] = [nums[ma], nums[i]];
        // 下向きのヒープ化を繰り返す
        i = ma;
    }
}

/* ヒープソート */
function heapSort(nums: number[]): void {
    // ヒープの構築：葉ノード以外の全ノードをヒープ化する
    for (let i = Math.floor(nums.length / 2) - 1; i >= 0; i--) {
        siftDown(nums, nums.length, i);
    }
    // ヒープから最大要素を取り出す処理を n-1 回繰り返す
    for (let i = nums.length - 1; i > 0; i--) {
        // 根と最右の葉を交換（先頭要素と末尾要素を交換）
        [nums[0], nums[i]] = [nums[i], nums[0]];
        // 根ノードから下向きにヒープ化する
        siftDown(nums, i, 0);
    }
}

/* 実行用コード */
const nums: number[] = [4, 1, 3, 1, 5, 2];
heapSort(nums);
console.log('ヒープソート完了後 nums =', nums);

export {};
