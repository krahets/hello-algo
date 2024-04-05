/**
 * File: heap_sort.js
 * Created Time: 2023-06-04
 * Author: Justin (xiefahit@gmail.com)
 */

/* 堆積的長度為 n ，從節點 i 開始，從頂至底堆積化 */
function siftDown(nums, n, i) {
    while (true) {
        // 判斷節點 i, l, r 中值最大的節點，記為 ma
        let l = 2 * i + 1;
        let r = 2 * i + 2;
        let ma = i;
        if (l < n && nums[l] > nums[ma]) {
            ma = l;
        }
        if (r < n && nums[r] > nums[ma]) {
            ma = r;
        }
        // 若節點 i 最大或索引 l, r 越界，則無須繼續堆積化，跳出
        if (ma === i) {
            break;
        }
        // 交換兩節點
        [nums[i], nums[ma]] = [nums[ma], nums[i]];
        // 迴圈向下堆積化
        i = ma;
    }
}

/* 堆積排序 */
function heapSort(nums) {
    // 建堆積操作：堆積化除葉節點以外的其他所有節點
    for (let i = Math.floor(nums.length / 2) - 1; i >= 0; i--) {
        siftDown(nums, nums.length, i);
    }
    // 從堆積中提取最大元素，迴圈 n-1 輪
    for (let i = nums.length - 1; i > 0; i--) {
        // 交換根節點與最右葉節點（交換首元素與尾元素）
        [nums[0], nums[i]] = [nums[i], nums[0]];
        // 以根節點為起點，從頂至底進行堆積化
        siftDown(nums, i, 0);
    }
}

/* Driver Code */
const nums = [4, 1, 3, 1, 5, 2];
heapSort(nums);
console.log('堆積排序完成後 nums =', nums);
