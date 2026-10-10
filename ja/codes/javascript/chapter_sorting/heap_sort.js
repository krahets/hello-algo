/**
 * File: heap_sort.js
 * Created Time: 2023-06-04
 * Author: Justin (xiefahit@gmail.com)
 */

/* ヒープの長さは n。ノード i から下方向にヒープ化 */
function siftDown(nums, n, i) {
    while (true) {
        // ノード i, l, r のうち値が最大のノードを ma とする
        let l = 2 * i + 1;
        let r = 2 * i + 2;
        let ma = i;
        if (l < n && nums[l] > nums[ma]) {
            ma = l;
        }
        if (r < n && nums[r] > nums[ma]) {
            ma = r;
        }
        // ノード i が最大、またはインデックス l, r が範囲外なら、ヒープ化は不要なので抜ける
        if (ma === i) {
            break;
        }
        // 2 つのノードを交換
        [nums[i], nums[ma]] = [nums[ma], nums[i]];
        // ループで上から下へヒープ化
        i = ma;
    }
}

/* ヒープソート */
function heapSort(nums) {
    // ヒープ構築：葉ノード以外のすべてのノードをヒープ化する
    for (let i = Math.floor(nums.length / 2) - 1; i >= 0; i--) {
        siftDown(nums, nums.length, i);
    }
    // ヒープから最大要素を取り出し、n-1 回繰り返す
    for (let i = nums.length - 1; i > 0; i--) {
        // 根ノードと最も右の葉ノードを交換（先頭要素と末尾要素を交換）
        [nums[0], nums[i]] = [nums[i], nums[0]];
        // 根ノードを起点に、上から下へヒープ化
        siftDown(nums, i, 0);
    }
}

/* Driver Code */
const nums = [4, 1, 3, 1, 5, 2];
heapSort(nums);
console.log('ヒープソート完了後 nums =', nums);
