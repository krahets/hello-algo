/**
 * File: binary_search_edge.ts
 * Created Time: 2023-08-22
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */
import { binarySearchInsertion } from './binary_search_insertion';

/* 最も左の target を二分探索 */
function binarySearchLeftEdge(nums: Array<number>, target: number): number {
    // target の挿入位置を探すのと等価
    const i = binarySearchInsertion(nums, target);
    // target が見つからなければ、-1 を返す
    if (i === nums.length || nums[i] !== target) {
        return -1;
    }
    // target が見つかったら、インデックス i を返す
    return i;
}

/* 最も右の target を二分探索 */
function binarySearchRightEdge(nums: Array<number>, target: number): number {
    // 最左の target + 1 を探す問題に変換する
    const i = binarySearchInsertion(nums, target + 1);
    // j は最も右の target を指し、i は target より大きい最初の要素を指す
    const j = i - 1;
    // target が見つからなければ、-1 を返す
    if (j === -1 || nums[j] !== target) {
        return -1;
    }
    // target が見つかったら、インデックス j を返す
    return j;
}

/* Driver Code */
// 重複要素を含む配列
let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
console.log('\n配列 nums = ' + nums);
// 二分探索で左端と右端を探す
for (const target of [6, 7]) {
    let index = binarySearchLeftEdge(nums, target);
    console.log('一番左の要素 ' + target + ' のインデックスは ' + index);
    index = binarySearchRightEdge(nums, target);
    console.log('一番右の要素 ' + target + ' のインデックスは ' + index);
}

export {};
