/**
 * File: binary_search_edge.ts
 * Created Time: 2023-08-22
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */
import { binarySearchInsertion } from './binary_search_insertion';

/* 二分探索で最も左にある target を探す */
function binarySearchLeftEdge(nums: Array<number>, target: number): number {
    // target の挿入位置を探すことに等しい
    const i = binarySearchInsertion(nums, target);
    // target が見つからなかったので、-1 を返す
    if (i === nums.length || nums[i] !== target) {
        return -1;
    }
    // target が見つかったので、インデックス i を返す
    return i;
}

/* 二分探索で最も右にある target を探す */
function binarySearchRightEdge(nums: Array<number>, target: number): number {
    // 最も左にある target + 1 を探す問題に変換する
    const i = binarySearchInsertion(nums, target + 1);
    // j は最も右にある target を指し、i は target より大きい最初の要素を指す
    const j = i - 1;
    // target が見つからなかったので、-1 を返す
    if (j === -1 || nums[j] !== target) {
        return -1;
    }
    // target が見つかったので、インデックス j を返す
    return j;
}

/* 実行用コード */
// 重複要素を含む配列
let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
console.log('\n配列 nums = ' + nums);
// 二分探索で左境界と右境界を求める
for (const target of [6, 7]) {
    let index = binarySearchLeftEdge(nums, target);
    console.log('最も左にある要素 ' + target + ' のインデックスは ' + index);
    index = binarySearchRightEdge(nums, target);
    console.log('最も右にある要素 ' + target + ' のインデックスは ' + index);
}

export {};
